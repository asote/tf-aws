variable "aws_key_path" {}

// Use the private key in the AWS console to decrypt the password after downloading the .rdp file
resource "aws_key_pair" "sftdeployer" {
  key_name   = "${var.aws_key_name}"
  public_key = "${file("${var.aws_key_path}")}"
}

resource "aws_instance" "win-vm" {
  count         = 1
  ami           = "ami-1712d877"        # Microsoft Windows Server 2012 R2 Base - ami-1712d877
  instance_type = "t2.micro"
  key_name      = "${var.aws_key_name}"

  tags = {
    Name = "as-win-vm1"
  }
}
