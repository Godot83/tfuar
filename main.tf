provider "aws" {
    region = "${var.AWS_REGION}"
    access_key = "${var.AWS_ACCESS_KEY}"
    secret_key = "${var.AWS_SECRET_KEY}"
}

resource "aws_instance" "example" {
    ami = "${var.AMI}"
    instance_type = "${var.INSTANCE_TYPE}"

    tags {
    Name = "${var.NAME}"
    }
}