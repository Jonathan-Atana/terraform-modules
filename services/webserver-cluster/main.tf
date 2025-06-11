/**
 * # Description
 *
 * This module is designed to create a cluster of web server using an Auto Scalling Group (ASG), which serve as target groups to a load balancer.
 * - The web servers accept inbound traffic only from the ALB's security group, and can route traffic to anywhere.
 * - The ALB allows incomming traffic on ports 80 and 443 (HTTP and HTTPS) from anywhere, and routes it to the web servers.
 * - The web servers are configured to run a simple Apache HTTP server that listens on a custom port (default is 8080). The server is installed by using a user data script.
 *
 * You can customize the module as needed by modifying the variables defined in `variables.tf`.
 *
 * ---
 *
 */

# Create a launch template for an ASG
resource "aws_launch_template" "main" {
  name = "${var.cluster_name}-launch-tmp"

  image_id               = data.aws_ami.main.id # Amazon Linux 2 AMI
  vpc_security_group_ids = [aws_security_group.ec2.id]
  instance_type          = var.instance_type

  user_data = base64encode(
    templatefile(
      "${path.module}/templates/user-data.sh",  # path.module is where the expression is defined
      {
        custom_http_port = var.custom_http_port # apache will be listening on this port (8080)
        db_port          = data.terraform_remote_state.mysql.outputs.db-port
        db_address       = data.terraform_remote_state.mysql.outputs.db-address
      }
    )
  )

  # Required when using a launch configuration/ template with an ASG
  lifecycle {
    create_before_destroy = true
  }
}

# Create an Auto Scaling Group (ASG) using the launch configuration
resource "aws_autoscaling_group" "main" {
  launch_template {
    id      = aws_launch_template.main.id
    version = "$Latest" # Use the latest version of the launch template
  }

  vpc_zone_identifier = data.aws_subnets.default.ids
  target_group_arns   = [aws_lb_target_group.main.arn] # Links the ASG to the target group
  health_check_type   = "ELB"

  min_size = var.min_size
  max_size = var.max_size

  tag {
    key                 = "Name"
    value               = "${var.cluster_name}-asg"
    propagate_at_launch = true
  }
}