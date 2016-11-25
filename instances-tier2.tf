resource "aws_instance" "app" {
  count                  = "3"
  ami                    = "ami-83d2f894"                   # Microsoft Windows Server 2012 R2 Base - ami-83d2f894
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.app.id}"]

  subnet_id         = "${aws_subnet.tier2-sub.id}"
  source_dest_check = false
  key_name          = "${var.aws_key_name}"

  tags = {
    Name          = "app-vm${count.index + 1}"
    Resource      = "Instance"
    ResourceGroup = "asotelo-tf-rgp"
    Ecosystem     = ""
    Application   = ""
    Environment   = ""
  }
}
