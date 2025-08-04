# provider "aws" {
#   region = var.region
# }

# # VPC
# resource "aws_vpc" "main" {
#   cidr_block           = var.vpc_cidr
#   enable_dns_support   = true
#   enable_dns_hostnames = true
#   tags = {
#     Name = "main-vpc"
#   }
# }

# # Subnet
# resource "aws_subnet" "public" {
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = var.public_subnet_cidr
#   map_public_ip_on_launch = true
#   availability_zone       = var.availability_zone
#   tags = {
#     Name = "public-subnet"
#   }
# }

# # Internet Gateway
# resource "aws_internet_gateway" "gw" {
#   vpc_id = aws_vpc.main.id
#   tags = {
#     Name = "main-gw"
#   }
# }

# # Route Table
# resource "aws_route_table" "public" {
#   vpc_id = aws_vpc.main.id
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.gw.id
#   }
#   tags = {
#     Name = "public-rt"
#   }
# }

# # Associate Route Table with Subnet
# resource "aws_route_table_association" "a" {
#   subnet_id      = aws_subnet.public.id
#   route_table_id = aws_route_table.public.id
# }

# # Security Group
# resource "aws_security_group" "ssh" {
#   name        = "allow_ssh"
#   description = "Allow SSH inbound traffic"
#   vpc_id      = aws_vpc.main.id

#   ingress {
#     description = "SSH"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     description = "HTTP"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "ssh-sg"
#   }
# }

# # Key Pair
# resource "aws_key_pair" "generated_key" {
#   key_name   = var.key_name
#   public_key = file("/home/ubuntu/.ssh/id_rsa.pub")
# }

# # EC2 Instance
# resource "aws_instance" "example" {
#   ami                    = var.ami
#   instance_type          = var.instance_type
#   subnet_id              = aws_subnet.public.id
#   vpc_security_group_ids = [aws_security_group.ssh.id]
#   key_name               = aws_key_pair.generated_key.key_name

#   tags = {
#     Name = "Terraform-EC2"
#   }

#   # Install Nginx on creation
#   provisioner "remote-exec" {
#     inline = [
#       "sudo apt update -y",
#       "sudo apt install nginx -y",
#       "sudo systemctl start nginx",
#       "sudo systemctl enable nginx"
#     ]
#   }

#   # SSH connection for remote-exec
#   connection {
#     type        = "ssh"
#     user        = "ubuntu"
#     private_key = file("/home/ubuntu/.ssh/id_rsa")
#     host        = self.public_ip
#   }
# }

# =======================================================================

# this is data sorces method of resources

# provider "aws" {
#   region = var.region
# }

# # Fetch the latest Ubuntu AMI dynamically
# data "aws_ami" "ubuntu" {
#   most_recent = true
#   owners      = ["099720109477"]  # Canonical

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#   }
# }

# # Security Group
# resource "aws_security_group" "ssh_http" {
#   name        = "allow_ssh_http"
#   description = "Allow SSH and HTTP"
#   vpc_id      = data.aws_vpc.default.id

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# # VPC Data Source (assuming default VPC)
# data "aws_vpc" "default" {
#   default = true
# }

# # Subnets Data Source (all subnets in the default VPC)
# data "aws_subnets" "default_vpc_subnets" {
#   filter {
#     name   = "vpc-id"
#     values = [data.aws_vpc.default.id]
#   }
# }

# # EC2 Instance
# resource "aws_instance" "example" {
#   ami                    = data.aws_ami.ubuntu.id
#   instance_type          = var.instance_type
#   subnet_id              = data.aws_subnets.default_vpc_subnets.ids[0] # first subnet
#   vpc_security_group_ids = [aws_security_group.ssh_http.id]
#   key_name               = var.key_name

#   tags = {
#     Name = "Dynamic-AMI-EC2"
#   }
# }


# vpc's hcl

# provider "aws" {
#   region = "var.region"
# }

# resource "aws_vpc" "Test_vpc" {
#   cidr_block           = var.cidr_block
#   enable_dns_support   = true
#   enable_dns_hostnames  = true

# tags = {
#   Name = "Testvpc"
# }
# }

# provider "aws" {
#   region = "us-east-1"
# }

# resource "aws_instance" "myinstance" {
#   ami                    = var.ami
#   instance_type          = var.instance_type
#   subnet_id              = var.subnet_id
#   vpc_security_group_ids = var.vpc_security_group_ids
#   key_name               = var.key_name
# }

provider "aws" {
  region = "us-east-1"
}

# Security group for SSH
resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow HTTP & SSH"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 instance
resource "aws_instance" "web" {
  ami             = "ami-0fc5d935ebf8bc3bc"  
  instance_type   = "t2.micro"
  key_name        = "my-new-key"          # Your AWS keypair
  security_groups = [aws_security_group.web_sg.name]
  count           = 2

  tags = {
    Name = "tools-${count.index+1}"
  }
}
