/**
 * # Description
 *
 * Making use of the local resource to download the private key pem, and uploading the public key to aws; this module creates a lightsail keypair ready to go
 *
 * ---
 *
 */

# create key pair
resource "tls_private_key" "main" {
  algorithm = "RSA"
  rsa_bits  = var.rsa_bits
}

# add public key to lightsail
resource "aws_lightsail_key_pair" "main" {
  name       = var.key_name
  public_key = tls_private_key.main.public_key_openssh
}

# Download private key
resource "local_file" "main" {
  file_permission = 0400
  filename        = "${var.file_path}/${local.full_key_name}"
  content         = tls_private_key.main.private_key_pem
}