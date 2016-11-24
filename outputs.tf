output "bastion_ip" {
  value = ["${aws_instance.bastion.private_ip}"]
}

output "webservers_ip" {
  value = ["${aws_instance.web.*.private_ip}"]
}

output "appservers_ip" {
  value = ["${aws_instance.app.*.private_ip}"]
}

output "sqlservers_ip" {
  value = ["${aws_instance.sql.*.private_ip}"]
}

output "fsw_ip" {
  value = ["${aws_instance.fsw.*.private_ip}"]
}

output "dcs_ip" {
  value = ["${aws_instance.dc.*.private_ip}"]
}

output "LBext_name" {
  value = ["${aws_elb.web.name}"]
}

output "LBint-app_name" {
  value = ["${aws_elb.app.name}"]
}

output "LBint-sql_name" {
  value = ["${aws_elb.sql.name}"]
}

output "LBext_DNS" {
  value = "${aws_elb.web.dns_name}"
}

output "LBext_Security_Group" {
  value = "${aws_elb.web.source_security_group}"
}

output "LBint_Security_Group" {
  value = "${aws_elb.sql.source_security_group}"
}
