variable "ecs_name" {}

resource "aws_iam_role" "ecs_role" {
  name               = "${var.ecs_name}"
  assume_role_policy = "${file("ecs.json")}"
}

resource "aws_iam_role_policy_attachment" "ecs-attach" {
  role       = "${aws_iam_role.ecs_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerServiceFullAccess"
  policy_arn = "arn:aws:iam::aws:policy/AmazonElasticMapReduceFullAccess"
}
