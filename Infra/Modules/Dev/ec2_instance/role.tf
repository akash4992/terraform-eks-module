# resource "aws_iam_role" "vitalx_prod_cps_01_app_role" {
#   name = "vitalx-prod-cps-01-app-role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Sid    = ""
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#       },
#     ]
#   })
# }

# resource "aws_iam_instance_profile" "vitalx_prod_cps_01_app_profile" {
#   name = "vitalx-prod-cps-01-app-profile"
#   role = aws_iam_role.vitalx_prod_cps_01_app_role.name
# }