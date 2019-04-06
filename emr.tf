resource "aws_iam_role" "emr_role" {
  name = "emr_role"

  assume_role_policy = "${file("a.json")}"

  tags = {
    Name = "emr-role"
  }
}
