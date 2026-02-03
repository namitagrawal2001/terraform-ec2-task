# Output for  instances created using count

# output "ec2_public_ip" {
#   value = aws_instance.my_instance[*].public_ip
# }

# output "ec2_public_dns" {
#   value = aws_instance.my_instance[*].public_dns   # [*]single output for multiple instances
# }

# output "ec2_private_id" {
#   value = aws_instance.my_instance[*].private_ip
# }




# Output for multiple instances created using for_each
output "ec2_public_ip" {
  value = [ 
    for key in aws_instance.my_instance : key.public_ip
  ]
}

output "ec2_public_dns" {
  value = [ 
    for key in aws_instance.my_instance : key.public_dns
  ]
}

output "ec2_private_ip" {
  value = [ 
    for key in aws_instance.my_instance : key.private_ip
  ]
}
output "ec2_instance_ids" {
  value = [ 
    for key in aws_instance.my_instance : key.id
  ]
}