<!-- BEGIN_TF_DOCS -->

# Description

This Terraform configuration creates an AWS EC2 instance with a specified AMI, instance type, and key pair.
It uses a module to create the key pair.
You can customize the module as needed by modifying the variables defined in `variables.tf`.

---

## Requirements

No requirements.

## Providers

| Name                                             | Version |
| ------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | n/a     |

## Modules

| Name                                                     | Source         | Version |
| -------------------------------------------------------- | -------------- | ------- |
| <a name="module_keypair"></a> [keypair](#module_keypair) | ../ec2_keypair | n/a     |

## Resources

| Name                                                                                                      | Type        |
| --------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_instance.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource    |
| [aws_ami.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami)        | data source |

## Inputs

| Name                                                                     | Description                                                      | Type           | Default                                                                           | Required |
| ------------------------------------------------------------------------ | ---------------------------------------------------------------- | -------------- | --------------------------------------------------------------------------------- | :------: |
| <a name="input_file_path"></a> [file_path](#input_file_path)             | Path to the creation of the private key pair                     | `string`       | `"locals"`                                                                        |    no    |
| <a name="input_filter_names"></a> [filter_names](#input_filter_names)    | List of names to use for filtering AMIs in the data source block | `list(string)` | <pre>[<br/> "amzn2-ami-hvm-*-x86_64-gp2"<br/>]</pre>                              |    no    |
| <a name="input_instance_type"></a> [instance_type](#input_instance_type) | Instance type to use for the AWS instance resource               | `string`       | `"t2.micro"`                                                                      |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                            | Tags in the AWS instance resource                                | `map(string)`  | <pre>{<br/> "Name": "server",<br/> "Team": "DevOps",<br/> "env": null<br/>}</pre> |    no    |
| <a name="input_user_data"></a> [user_data](#input_user_data)             | User data to use for the AWS instance resource                   | `string`       | `"#!/bin/bash\r\necho \"Hello, World!\" > /var/www/html/index.html\r\n"`          |    no    |

## Outputs

| Name                                                                 | Description                                |
| -------------------------------------------------------------------- | ------------------------------------------ |
| <a name="output_instance-id"></a> [instance-id](#output_instance-id) | Instance ID of the EC2 instance            |
| <a name="output_public-ip"></a> [public-ip](#output_public-ip)       | Public IP address of the EC2 instance      |
| <a name="output_ssh-command"></a> [ssh-command](#output_ssh-command) | SSH command to connect to the EC2 instance |

---

## Example Usage

This example demonstrates how to use the `ec2` module to provision and manage resources as intended. Update the variable values to match your environment and requirements.

```hcl
module "ec2" {
  source = "github.com/Jonathan-Atana/terraform-modules/compute/ec2"

  file_path       = "your custom path to where to create the private key pair"

  tags = {
    env  = "specify your environment"
    Name = "your resource name"
  }

  # Add more variables as needed
}
```

## Example Output

After applying this configuration, you can reference the module's outputs like this:

```hcl
output "example_output" {
  value = module.ec2.output_name
}
```

## Notes

- Adjust the `source` path as needed based on your project structure.
- Replace `ec2`, variable names, and values with those specific to your module.
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
