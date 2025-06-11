<!-- BEGIN_TF_DOCS -->

# Description

This module is designed to create a cluster of web server using an Auto Scalling Group (ASG), which serve as target groups to a load balancer.

- The web servers accept inbound traffic only from the ALB's security group, and can route traffic to anywhere.
- The ALB allows incomming traffic on ports 80 and 443 (HTTP and HTTPS) from anywhere, and routes it to the web servers.
- The web servers are configured to run a simple Apache HTTP server that listens on a custom port (default is 8080). The server is installed by using a user data script.

You can customize the module as needed by modifying the variables defined in `variables.tf`.

---

## Requirements

No requirements.

## Providers

| Name                                                               | Version |
| ------------------------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws)                   | n/a     |
| <a name="provider_terraform"></a> [terraform](#provider_terraform) | n/a     |

## Modules

No modules.

## Resources

| Name                                                                                                                                                          | Type        |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_autoscaling_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group)                                   | resource    |
| [aws_launch_template.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template)                                       | resource    |
| [aws_lb.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb)                                                                 | resource    |
| [aws_lb_listener.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener)                                               | resource    |
| [aws_lb_listener_rule.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule)                                     | resource    |
| [aws_lb_target_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group)                                       | resource    |
| [aws_security_group.alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)                                          | resource    |
| [aws_security_group.ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)                                          | resource    |
| [aws_vpc_security_group_egress_rule.allow_all](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule)    | resource    |
| [aws_vpc_security_group_ingress_rule.allow_http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource    |
| [aws_ami.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami)                                                            | data source |
| [aws_subnets.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets)                                                 | data source |
| [aws_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc)                                                         | data source |
| [terraform_remote_state.mysql](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state)                             | data source |

## Inputs

| Name                                                                                 | Description                                                      | Type           | Default                                              | Required |
| ------------------------------------------------------------------------------------ | ---------------------------------------------------------------- | -------------- | ---------------------------------------------------- | :------: |
| <a name="input_backend"></a> [backend](#input_backend)                               | The backend to use                                               | `string`       | `"s3"`                                               |    no    |
| <a name="input_cluster_name"></a> [cluster_name](#input_cluster_name)                | The name to use for all the cluster resources                    | `string`       | n/a                                                  |   yes    |
| <a name="input_config"></a> [config](#input_config)                                  | The configuration associated with the specified backend          | `map(string)`  | n/a                                                  |   yes    |
| <a name="input_custom_http_port"></a> [custom_http_port](#input_custom_http_port)    | The port the server will use for HTTP requests                   | `number`       | `8080`                                               |    no    |
| <a name="input_default_http_port"></a> [default_http_port](#input_default_http_port) | The port the ALB will use for HTTP requests                      | `number`       | `80`                                                 |    no    |
| <a name="input_filter_names"></a> [filter_names](#input_filter_names)                | List of names to use for filtering AMIs in the data source block | `list(string)` | <pre>[<br/> "amzn2-ami-hvm-*-x86_64-gp2"<br/>]</pre> |    no    |
| <a name="input_instance_type"></a> [instance_type](#input_instance_type)             | The type of EC2 Instances to run (e.g. t2.micro)                 | `string`       | `"t2.micro"`                                         |    no    |
| <a name="input_max_size"></a> [max_size](#input_max_size)                            | The maximum number of EC2 Instances in the ASG                   | `number`       | `2`                                                  |    no    |
| <a name="input_min_size"></a> [min_size](#input_min_size)                            | The minimum number of EC2 Instances in the ASG                   | `number`       | `1`                                                  |    no    |

## Outputs

| Name                                                                                | Description                       |
| ----------------------------------------------------------------------------------- | --------------------------------- |
| <a name="output_alb-dns-name"></a> [alb-dns-name](#output_alb-dns-name)             | The DNS name of the load balancer |
| <a name="output_alb-sec-group-id"></a> [alb-sec-group-id](#output_alb-sec-group-id) | The security group id of the ALB  |
| <a name="output_asg-name"></a> [asg-name](#output_asg-name)                         | The name of the ASG               |

---

## Example Usage

This example demonstrates how to use the `webserver_cluster` module to provision and manage resources as intended. Update the variable values to match your environment and requirements.

```hcl
module "webserver_cluster" {
  source = "github.com/Jonathan-Atana/terraform-modules/services/webserver-cluster?ref=v1.0.0"

  cluster_name = "your cluster name"
  min_size     = 2  # your least number of servers
  max_size     = 2  # your max number of servers

  backend = "local"  # your backend type (local, or remote, or s3, etc)
  config = {  # the configuration should be per backend type
    path = "../../storage/mysql/terraform.tfstate"  # this config suits the local backend
  }

  # Add more variables as needed
}
```

## Example Output

After applying this configuration, you can reference the module's outputs like this:

```hcl
output "example_output" {
  value = module.webserver_cluster.output_name
}
```

## Notes

- Adjust the `source` path as needed based on your project structure.
- Replace `webserver_cluster`, variable names, and values with those specific to your module.
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
