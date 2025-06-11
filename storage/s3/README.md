<!-- BEGIN_TF_DOCS -->

# Description

This Terraform configuration creates an AWS S3 bucket

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

| Name                                                                                                        | Type     |
| ----------------------------------------------------------------------------------------------------------- | -------- |
| [aws_s3_bucket.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |

## Inputs

| Name                                                               | Description                      | Type     | Default       | Required |
| ------------------------------------------------------------------ | -------------------------------- | -------- | ------------- | :------: |
| <a name="input_bucket_name"></a> [bucket_name](#input_bucket_name) | Name of bucket on s3             | `string` | n/a           |   yes    |
| <a name="input_region_name"></a> [region_name](#input_region_name) | Region where you want the bucket | `string` | `"us-east-1"` |    no    |

## Outputs

No outputs.

---

## Example Usage

This example demonstrates how to use the `s3` module to provision and manage resources as intended. Update the variable values to match your environment and requirements.

```hcl
module "s3" {
  source = "github.com/Jonathan-Atana/terraform-modules/storage/s3"

  bucket_name = "your bucket name"
  region_name = "your region"

  # Add more variables as needed according to variables.tf file
}
```

## Example Output

After applying this configuration, you can reference the module's outputs like this:

```hcl
output "example_output" {
  value = module.s3.output_name
}
```

## Notes

- Adjust the `source` path as needed based on your project structure.
- Replace `s3`, variable names, and values with those specific to your module.
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
