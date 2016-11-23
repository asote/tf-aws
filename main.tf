variable "aws_key_name" {}

resource "aws_instance" "win-vm" {
  count                  = 1
  ami                    = "ami-83d2f894"                     # Microsoft Windows Server 2012 R2 Base - ami-83d2f894
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.tier1.id}"]
  subnet_id              = "${aws_subnet.tier1.id}"
  key_name               = "${var.aws_key_name}"

  tags = {
    Name = "as-win-vm1"
  }
}
