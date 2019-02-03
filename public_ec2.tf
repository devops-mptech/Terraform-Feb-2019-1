resource "aws_instance" "myinstance" {
  # count                       = "${length(var.public_subnet)}"
  count                       = 1
  ami                         = "${lookup(var.ami,var.region)}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_name}"
  subnet_id                   = "${element(aws_subnet.publicsubnet1.*.id,count.index)}"
  vpc_security_group_ids      = ["${aws_default_security_group.default.id}"]
  associate_public_ip_address = true

  tags {
    Name = "PublicServer-${count.index + 1}"
  }
}
