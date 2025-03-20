
############ PROVIDER BLOCK ############
provider "aws" {
  region     = "us-east-1"
}
############ SAVING TF STATE FILE #########
terraform {
  backend "s3" {
    bucket  = "bilal-atlantis-bucket"
    key     = "atlantis/terraform.tfstate"
    region  = "us-east-1"
  }
}
################# EC2 INSTANCE CREATION #########
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "dasdsa"


  }
}
