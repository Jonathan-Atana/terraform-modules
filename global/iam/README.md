<!-- BEGIN_TF_DOCS -->

# Description

Configuration for the creation of an AWS IAM user

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

| Name                                                                                                      | Type     |
| --------------------------------------------------------------------------------------------------------- | -------- |
| [aws_iam_user.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |

## Inputs

| Name                                                         | Description              | Type     | Default     | Required |
| ------------------------------------------------------------ | ------------------------ | -------- | ----------- | :------: |
| <a name="input_user_name"></a> [user_name](#input_user_name) | The name of the IAM user | `string` | `"newUser"` |    no    |

## Outputs

| Name                                                                    | Description             |
| ----------------------------------------------------------------------- | ----------------------- |
| <a name="output_iam-user-arn"></a> [iam-user-arn](#output_iam-user-arn) | The ARN of the IAM user |

---

## Example Usage

This example demonstrates how to use the `iam_user` module to provision and manage resources as intended. Update the variable values to match your environment and requirements.

```hcl
module "iam_user" {
  source      = "github.com/Jonathan-Atana/terraform-modules/global/iam?ref=<the version to use>"

  user_name = "the name of your IAM user"

  # Add more variables as needed
}
```

## Example Output

After applying this configuration, you can reference the module's outputs like this:

```hcl
output "example_output" {
  value = module.iam_user.output_name
}
```

## Notes

- Adjust the `source` path as needed based on your project structure.
- Replace `iam_user`, variable names, and values with those specific to your module.
- For more details, see the [HashiCorp Terraform Module Documentation](https://developer.hashicorp.com/terraform/language/modules/develop/examples).

---

## Additional Resources

- [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
- [Terraform Module Registry](https://registry.terraform.io/)
- [Best Practices for Module Development](https://developer.hashicorp.com/terraform/language/modules/develop)

## Authors

- **Author:** Jonathan
- **Generated on:** 2025-06-13
<!-- END_TF_DOCS -->
