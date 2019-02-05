resource "aws_instance" "nat1" {
  count                       = "${var.nat_count}"
  ami                         = "${lookup(var.ami_nat,var.region)}"
  instance_type               = "${var.instance_type}"
  subnet_id                   = "${aws_subnet.publicsubnet1.*.id[0]}"
  key_name                    = "${var.key_name}"
  vpc_security_group_ids      = ["${aws_default_security_group.default.id}"]
  associate_public_ip_address = true
  source_dest_check           = false

  tags {
    Name = "Nat_Instance"
  }
}
