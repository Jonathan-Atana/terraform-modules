/**
 * # Description
 *
 * This Terraform configuration creates an AWS EC2 instance with a specified AMI, instance type, and key pair.
 * It uses a module to create the key pair.
 * You can customize the module as needed by modifying the variables defined in `variables.tf`.
 *
 * ---
 *
 */
module "keypair" {
  source = "../ec2_keypair"

  key_name = "${var.tags["Name"]}-key"
  file_path = var.file_path
  rsa_bits = 4096
}

# Data sources
data "aws_ami" "main" {  # get the latest specified ami
  most_recent = true
  owners      = ["amazon"] # Amazon's official AMIs

  filter {
    name   = "name"
    values = var.filter_names
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

// Create the AWS instance resource
resource "aws_instance" "main" {
  ami           = data.aws_ami.main.id  # Default: Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = var.instance_type

  key_name = module.keypair.key-name  # implicit dependency on the keypair module

  user_data = var.user_data

  tags = var.tags
}