variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "vpc cidr block"
}

variable "aws_region" {
  description = "aws region for vpc setup"
}
