# resource "aws_instance" "myinstance1" {
#   count                  = 1
#   ami                    = "${lookup(var.ami,var.region)}"
#   instance_type          = "${var.instance_type}"
#   key_name               = "${var.key_name}"
#   subnet_id              = "${element(aws_subnet.nat_instance.*.id,count.index)}"
#   vpc_security_group_ids = ["${aws_default_security_group.default.id}"]
#
#   tags {
#     Name = "PrivateServer-${count.index + 1}"
#   }
# }

