output "iam-user-arn" {
  description = "The ARN of the IAM user"
  value = aws_iam_user.main.arn
}