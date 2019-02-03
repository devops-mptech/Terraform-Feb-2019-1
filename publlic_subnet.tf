resource "aws_subnet" "publicsubnet1" {
  count             = "${var.subnet_count}"
  vpc_id            = "${aws_vpc.myvpc.id}"
  cidr_block        = "${element(var.public_subnet,count.index)}"
  availability_zone = "${element(var.azs,count.index)}"

  tags = {
    Name = "WestronPublicSubnet-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.myvpc.id}"

  tags {
    Name = "Westron_IGW"
  }
}

resource "aws_default_route_table" "DEFAULT_RT" {
  default_route_table_id = "${aws_vpc.myvpc.default_route_table_id}"

  route {
    cidr_block = "${var.igw_cidr}"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = {
    Name = "Westron_Default_RT"
  }
}
