resource "aws_subnet" "nat_instance" {
  count             = "${length(var.nat_private_subnet_cidrs)}"
  vpc_id            = "${aws_vpc.myvpc.id}"
  cidr_block        = "${element(var.nat_private_subnet_cidrs,count.index)}"
  availability_zone = "${element(var.azs,count.index)}"

  tags = {
    Name = "Nat_Instance_Westron_Private-${count.index + 1}"
  }
}

resource "aws_route_table" "NAT_INSTANCE_RT" {
  vpc_id = "${aws_vpc.myvpc.id}"

  route {
    cidr_block  = "${var.igw_cidr}"
    instance_id = "${aws_instance.nat1.id}"
  }

  tags = {
    Name = "Westron_Nat_Instance_RT"
  }
}

resource "aws_route_table_association" "a" {
  count          = "${length(var.nat_private_subnet_cidrs)}"
  subnet_id      = "${element(aws_subnet.nat_instance.*.id,count.index)}"
  route_table_id = "${aws_route_table.NAT_INSTANCE_RT.id}"
}
