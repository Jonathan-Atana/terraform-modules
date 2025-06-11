<!-- BEGIN_TF_DOCS -->

# Description

This Terraform configuration creates an AWS EBS volume and attaches it to a given server

---

## Requirements

No requirements.

## Providers

| Name                                             | Version |
| ------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | n/a     |

## Modules

No modules.

## Resources

| Name                                                                                                                        | Type     |
| --------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_ebs_volume.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ebs_volume)               | resource |
| [aws_volume_attachment.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/volume_attachment) | resource |

## Inputs

| Name                                                               | Description                                                | Type          | Default                                          | Required |
| ------------------------------------------------------------------ | ---------------------------------------------------------- | ------------- | ------------------------------------------------ | :------: |
| <a name="input_az"></a> [az](#input_az)                            | Availability zone for the EBS volume                       | `string`      | `"us-east-1a"`                                   |    no    |
| <a name="input_device_name"></a> [device_name](#input_device_name) | The device name to expose to the instance (e.g. /dev/xvdf) | `string`      | `"/dev/sdh"`                                     |    no    |
| <a name="input_instance_id"></a> [instance_id](#input_instance_id) | The ID of the EC2 instance to attach the volume to         | `string`      | n/a                                              |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                      | Tags to use                                                | `map(string)` | <pre>{<br/> "name": "example-volume"<br/>}</pre> |    no    |
| <a name="input_volume_size"></a> [volume_size](#input_volume_size) | Size of the EBS volume in GB                               | `number`      | `10`                                             |    no    |

## Outputs

| Name                                                                       | Description                     |
| -------------------------------------------------------------------------- | ------------------------------- |
| <a name="output_attachment_id"></a> [attachment_id](#output_attachment_id) | The ID of the volume attachment |
| <a name="output_volume_id"></a> [volume_id](#output_volume_id)             | ID of the created EBS volume    |

---

## Example Usage

This example demonstrates how to use the `attach_ebs` module to provision and manage resources as intended. Update the variable values to match your environment and requirements.

```hcl
module "attach_ebs" {
  source = "github.com/Jonathan-Atana/terraform-modules/storage/attach_ebs"

  device_name = "your device name"
  az          = "your availability zone"
  volume_size = 10  # your volume size as number
  instance_id = module.ec2.instance-id  # an ec2 instance id from a resource or module

  tags = {
    Name = "the name of your ebs resource"
  }

  # Add more variables as needed
}
```

## Example Output

After applying this configuration, you can reference the module's outputs like this:

```hcl
output "example_output" {
  value = module.attach_ebs.output_name
}
```

## Notes

- Adjust the `source` path as needed based on your project structure.
- Replace `attach_ebs`, variable names, and values with those specific to your module.
- For more details, see the [HashiCorp Terraform Module Documentation](https://developer.hashicorp.com/terraform/language/modules/develop/examples).

---

## Additional Resources

- [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
- [Terraform Module Registry](https://registry.terraform.io/)
- [Best Practices for Module Development](https://developer.hashicorp.com/terraform/language/modules/develop)

## Authors

- **Author:** Jonathan
- **Generated on:** 2025-06-06
<!-- END_TF_DOCS -->
