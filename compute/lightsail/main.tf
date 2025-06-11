/**
 * # Description
 *
 * This Terraform configuration creates an AWS lightsail instance with a specified AMI, instance type, and key pair.
 * It uses the light_keypair module to create the key pair.
 * You can customize the module as needed by modifying the variables defined in `variables.tf`.
 *
 * ---
 *
 */

# Create a new Lightsail Key Pair using the lightsail_keypair module
module "keypair" {
  source = "../light_keypair"

  key_name = "${var.server_name}-key"
  file_path = var.file_path
  rsa_bits = 4096
}

# Create a new terraform Lightsail Instance
resource "aws_lightsail_instance" "main" {
  name              = var.server_name

  availability_zone = var.availability_zone
  blueprint_id      = var.blueprint_id
  bundle_id         = var.bundle_id

  key_pair_name     = module.keypair.key-name  # implicit dependency on the keypair module

  user_data = var.user_data

  tags = var.tags
}

