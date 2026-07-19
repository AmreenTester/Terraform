variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t3.micro"
}

variable "subnet_id" {
  description = "Subnet ID where EC2 will be launched"
  type        = string
  default     = "subnet-04877e6f36dafe194"
}

variable "ami_id" {
  description = "ubuntu_ami_id"
  type        = string
  default     = "ami-01a00762f46d584a1"
}


