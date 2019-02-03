resource "aws_subnet" "privatesubnet" {
  count             = "${length(var.private_subnet_cidrs)}"
  vpc_id            = "${aws_vpc.myvpc.id}"
  cidr_block        = "${element(var.private_subnet_cidrs,count.index)}"
  availability_zone = "${element(var.azs,count.index)}"

  tags = {
    Name = "WestronPrivateSubnet-${count.index + 1}"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = "${aws_vpc.myvpc.id}"

  route {
    cidr_block     = "${var.igw_cidr}"
    nat_gateway_id = "${aws_nat_gateway.gw.id}"
  }

  tags = {
    Name = "Westron_Private_RT"
  }
}

resource "aws_route_table_association" "ra" {
  count          = "${length(var.private_subnet_cidrs)}"
  subnet_id      = "${element(aws_subnet.privatesubnet.*.id,count.index)}"
  route_table_id = "${aws_route_table.private_rt.id}"
}

resource "aws_eip" "lb" {
  vpc = true
}

resource "aws_nat_gateway" "gw" {
  allocation_id = "${aws_eip.lb.id}"
  subnet_id     = "${aws_subnet.publicsubnet1.*.id[1]}"
}
