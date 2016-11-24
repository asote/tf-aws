variable "aws_key_name" {}

resource "aws_instance" "web" {
  count                  = 2
  ami                    = "ami-83d2f894"                   # Microsoft Windows Server 2012 R2 Base - ami-83d2f894
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1b"
  vpc_security_group_ids = ["${aws_security_group.web.id}"]

  subnet_id                   = "${aws_subnet.tier1-sub.id}"
  associate_public_ip_address = true
  source_dest_check           = false
  key_name                    = "${var.aws_key_name}"

  tags = {
    Name = "web-vm${count.index + 1}"
  }
}

resource "aws_eip" "web" {
  instance                  = "${aws_instance.web.id}"
  associate_with_private_ip = "10.0.1.${count.index + 5}"
  vpc                       = true
}
