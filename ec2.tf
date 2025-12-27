# key pair {login}

resource "aws_key_pair" "my_key" {
  key_name   = "terra-key-ec2"
  public_key = file("terra-key-ec.pub")
}

# vpc & security group 
resource "aws_default_vpc" "default" {

}


resource "aws_security_group" "my_security_group" {
  name        = "automate-sg"
  description = "Security group for automated EC2 instance"
  vpc_id      = aws_default_vpc.default.id #interpolation

  #inbound rule 
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH open"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP open"
  }

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Flask app"
  }
  # outbound rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "all access open outbound "

  }

  tags = {
    Name = "automate-sg"
  }
}

# ec2 instance

resource "aws_instance" "my_instance" {
  for_each = tomap ({
    Terraform-in-one-shot-microm = "t2.micro",
    Terraform-in-one-shot-medium = "t2.medium" 
  })  #loop to create multiple instances meta argument


  depends_on = [ aws_security_group.my_security_group, aws_key_pair.my_key ] # to ensure security group and key pair are created before instance

  key_name        = aws_key_pair.my_key.key_name #interpolation
  security_groups = [aws_security_group.my_security_group.name]
  instance_type   = each.value
  ami             = var.ec2_ami_id
  user_data       = file(".terraform/install.nginx.sh")

  root_block_device {
    volume_size = var.env == "prd" ? 20 : var.ec2_default_root_storages_size
    volume_type = "gp3"
  }
  tags = {
    Name = each.key

  }

}

