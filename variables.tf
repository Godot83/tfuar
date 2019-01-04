variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {}
variable "AMI" {}
variable "INSTANCE_TYPE" {}
variable "NAME" {}
variable "SERVER_PORT" {
    description = "The port the server will use for HTTP requests"
    default = 8080
}
