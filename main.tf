variable "aws_key_name" {}

resource "aws_instance" "win-vm" {
  count         = 1
  ami           = "ami-1e4c8476"        # Microsoft Windows Server 2012 R2 Base - ami-1e4c8476
  instance_type = "t2.micro"
  key_name      = "${var.aws_key_name}"

  tags = {
    Name = "as-win-vm1"
  }
}
