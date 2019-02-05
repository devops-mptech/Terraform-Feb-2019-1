output "public_ip" {
  value = "${aws_instance.myinstance.public_ip}"
}

output "dns_name" {
  value = "${aws_instance.myinstance.public_dns}"
}

output "Instance_id" {
  value = "${aws_instance.myinstance.id}"
}

output "Public_Subnet_IDS" {
  value = "${aws_subnet.publicsubnet1.*.id}"
}
