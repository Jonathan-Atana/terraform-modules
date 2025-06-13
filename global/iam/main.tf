/**
 * # Description
 *
 * Configuration for the creation of an AWS IAM user
 *
 * ---
 *
 */

 resource "aws_iam_user" "main" {
   name = var.user_name
 }