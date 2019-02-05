resource "aws_vpc" "myvpc1" {
  cidr_block = "178.96.0.0/16"

  tags {
    Name = "CITY_VPC"
  }
}

# resource "aws_subnet" "pub" {
#   vpc_id            = "${aws_vpc.myvpc1.id}"
#   cidr_block        = "178.96.0.0/25"
#   availability_zone = "ap-south-1a "
#
#   tags = {
#     Name = "CITY_SUBNET"
#   }
# }

