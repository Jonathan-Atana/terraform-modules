<!-- BEGIN_TF_DOCS -->

# Description

This Terraform configuration creates an AWS lightsail instance with a specified AMI, instance type, and key pair.
It uses the light_keypair module to create the key pair.
You can customize the module as needed by modifying the variables defined in `variables.tf`.

---

## Requirements

No requirements.

## Providers

| Name                                             | Version |
| ------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | n/a     |

## Modules

| Name                                                     | Source           | Version |
| -------------------------------------------------------- | ---------------- | ------- |
| <a name="module_keypair"></a> [keypair](#module_keypair) | ../light_keypair | n/a     |

## Resources

| Name                                                                                                                          | Type     |
| ----------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_lightsail_instance.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lightsail_instance) | resource |

## Inputs

| Name                                                                                 | Description                                        | Type          | Default                                                                  | Required |
| ------------------------------------------------------------------------------------ | -------------------------------------------------- | ------------- | ------------------------------------------------------------------------ | :------: |
| <a name="input_availability_zone"></a> [availability_zone](#input_availability_zone) | The availability zone for the Lightsail instance.  | `string`      | `"us-east-1a"`                                                           |    no    |
| <a name="input_blueprint_id"></a> [blueprint_id](#input_blueprint_id)                | The blueprint ID for the Lightsail instance.       | `string`      | `"centos_stream_9"`                                                      |    no    |
| <a name="input_bundle_id"></a> [bundle_id](#input_bundle_id)                         | The bundle ID for the Lightsail instance.          | `string`      | `"nano_3_0"`                                                             |    no    |
| <a name="input_file_path"></a> [file_path](#input_file_path)                         | Path to the creation of the private key pair       | `string`      | `"locals"`                                                               |    no    |
| <a name="input_server_name"></a> [server_name](#input_server_name)                   | The name of the Lightsail instance.                | `string`      | `"server"`                                                               |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                                        | A map of tags to assign to the Lightsail instance. | `map(string)` | <pre>{<br/> "Team": "DevOps",<br/> "env": null<br/>}</pre>               |    no    |
| <a name="input_user_data"></a> [user_data](#input_user_data)                         | User data to use for the Lightsail resource        | `string`      | `"#!/bin/bash\r\necho \"Hello, World!\" > /var/www/html/index.html\r\n"` |    no    |

## Outputs

| Name                                                                 | Description                                                   |
| -------------------------------------------------------------------- | ------------------------------------------------------------- |
| <a name="output_public-ip"></a> [public-ip](#output_public-ip)       | The public ip of the server                                   |
| <a name="output_ssh-command"></a> [ssh-command](#output_ssh-command) | Command to remotely connect to the lightsail instance via ssh |

---

## Example Usage

This example demonstrates how to use the `lightsail` module to provision and manage resources as intended. Update the variable values to match your environment and requirements.

```hcl
module "lightsail" {
  source = "github.com/Jonathan-Atana/terraform-modules/compute/lightsail"

  server_name = "your server name"

  tags = {
    env = "your environment name"
  }

  # Add more variables as needed
}
```

## Example Output

After applying this configuration, you can reference the module's outputs like this:

```hcl
output "example_output" {
  value = module.lightsail.output_name
}
```

## Notes

- Adjust the `source` path as needed based on your project structure.
- Replace `lightsail`, variable names, and values with those specific to your module.
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
