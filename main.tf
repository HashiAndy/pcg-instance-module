# Create a new instance of the latest Ubuntu 14.04 on an
# t2.micro node with an AWS Tag naming it "HelloWorld"
provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = %{ if var.os == "ubuntu" }${data.aws_ami.ubuntu.id}%{ if var.os == "centos" }${data.aws_ami.centos.id}%{ endif }!
  instance_type = "t2.micro"

  tags = {
    Name = "${var.tag_name}"
    TTL = "${var.tag_ttl}"
    Owner = "${var.tag_owner}"
  }
}
