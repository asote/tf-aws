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

output "LB_name" {
  value = ["${aws_elb.web.name}"]
}

output "LB_instances" {
  value = ["${aws_elb.web.instances}"]
}

output "LB_DNS" {
  value = "${aws_elb.web.dns_name}"
}

output "LB_Security_Group" {
  value = "${aws_elb.web.source_security_group}"
}
