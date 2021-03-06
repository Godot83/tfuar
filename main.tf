provider "aws" {
    region = "${var.AWS_REGION}"
    access_key = "${var.AWS_ACCESS_KEY}"
    secret_key = "${var.AWS_SECRET_KEY}"
}

resource "aws_instance" "example" {
    ami = "${var.AMI}"
    instance_type = "${var.INSTANCE_TYPE}"
    vpc_security_group_ids = ["${aws_security_group.instance.id}"]

    user_data = <<-EOF
    #!/bin/bash
    echo "Hello, World" > index.html
    nohup busybox httpd -f -p "${var.SERVER_PORT}" &
    EOF

    tags {
    Name = "${var.NAME}"
    }
}

resource "aws_security_group" "instance" {
    name = "terraform-example-instance"
    ingress {
    from_port = "${var.SERVER_PORT}"
    to_port = "${var.SERVER_PORT}"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
}