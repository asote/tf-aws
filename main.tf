variable "aws_key_name" {}

resource "aws_instance" "win-vm" {
  count                       = 1
  ami                         = "ami-83d2f894"                   # Microsoft Windows Server 2012 R2 Base - ami-83d2f894
  instance_type               = "t2.micro"
  availability_zone           = "us-east-1b"
  vpc_security_group_ids      = ["${aws_security_group.web.id}"]
  subnet_id                   = "${aws_subnet.tier1-sub.id}"
  associate_public_ip_address = true
  source_dest_check           = false
  key_name                    = "${var.aws_key_name}"

  tags = {
    Name = "as-win-vm1"
  }
}

resource "aws_eip" "web-1" {
  instance = "${aws_instance.win-vm.id}"
  vpc      = true
}
