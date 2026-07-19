resource "aws_instance" "app_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type

  subnet_id              = var.subnet_id
  vpc_security_group_ids = ["sg-05c25390874fc7fab"]

  key_name = aws_key_pair.ec2_key.key_name

  tags = {
    Name = "learn-terraform"
  }
}

# Generate a new private key
resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create AWS Key Pair
resource "aws_key_pair" "ec2_key" {
  key_name   = "learn-terraform-key"
  public_key = tls_private_key.ec2_key.public_key_openssh
}

# Save the private key as a .pem file
resource "local_file" "private_key" {
  filename        = "${path.module}/learn-terraform-key.pem"
  content         = tls_private_key.ec2_key.private_key_pem
  file_permission = "0400"
}