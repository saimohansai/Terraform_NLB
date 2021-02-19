resource "aws_security_group" "Allow-all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"
  vpc_id      = "${aws_vpc.my-aws.id}"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    }
  tags = {

    Name= "Allow_all"
  }
}

resource "aws_instance" "private" {
  #count = 1
  count = length(aws_subnet.private)
  ami = "${lookup(var.Myimages,"us-east-1")}"
  instance_type = "t2.micro"
  #availability_zone = "${element(var.azs,count.index)}"
  subnet_id = aws_subnet.private[count.index].id
  vpc_security_group_ids = ["${aws_security_group.Allow-all.id}"]
  key_name = "Terraform"
  user_data = "${file("package_install-${count.index}.sh")}"
  #associate_public_ip_address = false
  tags = {
    Name = "private-.${count.index}"
  }
}

resource "aws_instance" "public" {
  #count = 1
  count = length(aws_subnet.public)
  ami = "${lookup(var.Myimages,"us-east-1")}"
  instance_type = "t2.micro"
  #availability_zone = "${element(var.azs,count.index)}"
  subnet_id = aws_subnet.public[count.index].id
  vpc_security_group_ids = ["${aws_security_group.Allow-all.id}"]
  key_name = "Terraform"
  user_data = "${file("package_install-${count.index}.sh")}"
  #"Personal-Private-${count.index}"
  #associate_public_ip_address = true
  tags = {
    Name = "Public-.${count.index}"
  }
}

