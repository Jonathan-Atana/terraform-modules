<!-- BEGIN_TF_DOCS -->

# Description

Making use of the local resource to download the private key pem, and uploading the public key to aws; this module creates a lightsail keypair ready to go

---

## Requirements

No requirements.

## Providers

| Name                                                   | Version |
| ------------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws)       | n/a     |
| <a name="provider_local"></a> [local](#provider_local) | n/a     |
| <a name="provider_tls"></a> [tls](#provider_tls)       | n/a     |

## Modules

No modules.

## Resources

| Name                                                                                                                          | Type     |
| ----------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_lightsail_key_pair.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lightsail_key_pair) | resource |
| [local_file.main](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file)                         | resource |
| [tls_private_key.main](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key)               | resource |

## Inputs

| Name                                                         | Description                                  | Type     | Default       | Required |
| ------------------------------------------------------------ | -------------------------------------------- | -------- | ------------- | :------: |
| <a name="input_file_path"></a> [file_path](#input_file_path) | Path to the creation of the private key pair | `string` | `"locals"`    |    no    |
| <a name="input_key_name"></a> [key_name](#input_key_name)    | Name of the lightsail instance key pair      | `string` | `"light-key"` |    no    |
| <a name="input_rsa_bits"></a> [rsa_bits](#input_rsa_bits)    | RSA encryption bits size                     | `number` | `4098`        |    no    |

## Outputs

| Name                                                        | Description                    |
| ----------------------------------------------------------- | ------------------------------ |
| <a name="output_key-name"></a> [key-name](#output_key-name) | Name of the lightsail key pair |

---

## Example Usage

This example demonstrates how to use the `keypair` module to provision and manage resources as intended. Update the variable values to match your environment and requirements.

```hcl
module "keypair" {
  source = "github.com/Jonathan-Atana/terraform-modules/compute/light_keypair"

  key_name = "your key name"
  file_path = "path to where to create your private key"
  rsa_bits = 4096  # encryption type e.g 2048

  # Add more variables as needed
}
```

## Example Output

After applying this configuration, you can reference the module's outputs like this:

```hcl
output "example_output" {
  value = module.keypair.output_name
}
```

## Notes

- Adjust the `source` path as needed based on your project structure.
- Replace `keypair`, variable names, and values with those specific to your module.
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
