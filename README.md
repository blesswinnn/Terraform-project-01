# Terraform-project-01


# PROJECT ARCHITECTURE :

![image](https://github.com/user-attachments/assets/fa46ce9b-62a5-41f0-bb11-0da1bd617642)

# TOPICS COVERED IN THE PROJECT:
AWS IAM Setup
⌨️ Local Environment Setup
⌨️ Let's Build! (7:22)
⌨️ AWS Provider and Terraform Init
⌨️ A VPC and Terraform Apply
⌨️ The Terraform State
⌨️ Terraform Destroy
⌨️ A Subnet and Referencing
⌨️ An IGW and Terraform fmt
⌨️ A Route Table
⌨️ A Route Table Association
⌨️ A Security Group
⌨️ An AMI Datasource
⌨️ A Key Pair
⌨️ An EC2 Instance
⌨️ Userdata and the File Function
⌨️ SSH Config Scripts
⌨️ The Provisioner and Templatefile
⌨️ The Deployment and Replace
⌨️ Variables
⌨️ Variable Precedence
⌨️ Conditional Expressions
⌨️ Outputs


# Main terraform script:

```
resource "aws_vpc" "mtc_vpc" {
  cidr_block           = "10.123.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "dev"
  }
}

resource "aws_subnet" "mtc_public_subnet" {
  vpc_id                  = aws_vpc.mtc_vpc.id
  cidr_block              = "10.123.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-west-2a"

  tags = {
    Name = "dev-public"
  }
}

resource "aws_internet_gateway" "mtc_internet_gateway" {
  vpc_id = aws_vpc.mtc_vpc.id

  tags = {
    Name = "dev-igw"
  }
}

resource "aws_route_table" "mtc_public_rt" {
  vpc_id = aws_vpc.mtc_vpc.id

  tags = {
    Name = "dev-public-rt"
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.mtc_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.mtc_internet_gateway.id
}

resource "aws_route_table_association" "mtc_public_aassoc" {
  subnet_id      = aws_subnet.mtc_public_subnet.id
  route_table_id = aws_route_table.mtc_public_rt.id
}

resource "aws_security_group" "mtc_sg" {
  name        = "dev-sg"
  description = "dev security group"
  vpc_id      = aws_vpc.mtc_vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "mtc_auth" {
  key_name   = "mtckey"
  public_key = file("~/.ssh/mtckey.pub")
}


resource "aws_instance" "dev_node" {
  instance_type = "t2.micro"
  ami           = data.aws_ami.server_ami.id
  key_name               = aws_key_pair.mtc_auth.id
  vpc_security_group_ids = [aws_security_group.mtc_sg.id]
  subnet_id              = aws_subnet.mtc_public_subnet.id
  user_data = file("userdata.tpl")

root_block_device {
    volume_size = 10
  }

  tags = {
    Name = "dev-node"
  }

  provisioner "local-exec" {
    command = templatefile("${var.host_os}-ssh-config.tpl", {
        hostname = self.public_ip,
        user = "ubuntu",
        identityfile = "~/.ssh/mtckey"
    })
    interpreter =  var.host_os == "windows" ? ["powershell", "-Command"] : ["bash", "-c"]
    
  }

}


```


# rest all sub scripts provided in main branch.

# resources created using terraform in AWS CLOUD :

![image](https://github.com/user-attachments/assets/78b9e712-5b2c-479b-bd54-3def00b3ddaa)

![image](https://github.com/user-attachments/assets/5bff5786-2747-4786-9159-e04ab6046bbf)

![image](https://github.com/user-attachments/assets/d39b1596-aae3-49c2-b084-ee8ee70e842a)

![image](https://github.com/user-attachments/assets/97b39b2f-c9cf-45b7-865a-df5f9b969922)

![image](https://github.com/user-attachments/assets/707e6cfe-330d-453d-87b7-664c73e8806b)

![image](https://github.com/user-attachments/assets/cf782691-dce4-4318-ad40-8974f0d462ed)

![image](https://github.com/user-attachments/assets/670af88b-5396-4951-a4d6-8aa2ca0b02a0)




