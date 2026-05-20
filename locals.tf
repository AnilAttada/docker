locals {
  ami_id = data.aws_ami.joindevops.id
  
  common_tags = {
    Project = "roboshop"
    Environment = "dev"
    Terraform = true
  }
}