<!-- BEGIN_TF_DOCS -->

# Description

This Terraform configuration sets up a MySQL database

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

| Name                                                                                                            | Type     |
| --------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_db_instance.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |

## Inputs

| Name                                                                                 | Description                             | Type     | Default         | Required |
| ------------------------------------------------------------------------------------ | --------------------------------------- | -------- | --------------- | :------: |
| <a name="input_allocated_storage"></a> [allocated_storage](#input_allocated_storage) | Storage to be allocated to the database | `number` | `10`            |    no    |
| <a name="input_db_name"></a> [db_name](#input_db_name)                               | Name of the database                    | `string` | `"mydb"`        |    no    |
| <a name="input_db_password"></a> [db_password](#input_db_password)                   | The password for the MySQL database     | `string` | n/a             |   yes    |
| <a name="input_db_username"></a> [db_username](#input_db_username)                   | The username for the MySQL database     | `string` | n/a             |   yes    |
| <a name="input_engine"></a> [engine](#input_engine)                                  | Database engine to use                  | `string` | `"mysql"`       |    no    |
| <a name="input_engine_version"></a> [engine_version](#input_engine_version)          | Database engine version                 | `string` | `"8.0"`         |    no    |
| <a name="input_identifier_prefix"></a> [identifier_prefix](#input_identifier_prefix) | Prefix to use to identify the database  | `string` | n/a             |   yes    |
| <a name="input_instance_class"></a> [instance_class](#input_instance_class)          | Instance class for the database         | `string` | `"db.t3.micro"` |    no    |

## Outputs

| Name                                                              | Description                                                  |
| ----------------------------------------------------------------- | ------------------------------------------------------------ |
| <a name="output_db-address"></a> [db-address](#output_db-address) | Connect to the MySQL database at this endpoint               |
| <a name="output_db-port"></a> [db-port](#output_db-port)          | The port on which the MySQL database is listening/accessible |

---

## Example Usage

This example demonstrates how to use the `mysql` module to provision and manage resources as intended. Update the variable values to match your environment and requirements.

```hcl
module "mysql" {
  source = "github.com/Jonathan-Atana/terraform-modules/storage/mysql?ref=v1.0.0"

  identifier_prefix = "your identifier prefix"

  db_username = "your database username"
  db_password = "your database password"

  # Add more variables as needed
}
```

## Example Output

After applying this configuration, you can reference the module's outputs like this:

```hcl
output "example_output" {
  value = module.mysql.output_name
}
```

## Notes

- Adjust the `source` path as needed based on your project structure.
- Replace `mysql`, variable names, and values with those specific to your module.
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
