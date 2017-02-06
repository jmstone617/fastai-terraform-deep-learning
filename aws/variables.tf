variable "ami" {
  description = "AWS AMI ID of a GPU-based AMI built specifically for deep learning work loads."

  default = {
    us-east-1 = "ami-31ecfb26" # fastai-dl-01
    us-west-2 = "ami-bc508adc" # fastai-dl-01
  }
}

variable "ssh_key_name" {
  description = "SSH key name in your AWS account for AWS instances"
}

variable "ssh_key_path" {
  description = "Path to SSH key, specified by ssh_key_name"
}

variable "region" {
  description = "AWS region"

  default = "us-east-1"
}

variable "availability_zone_1" {
  description = ""

  default = {
    us-east-1 = "us-east-1b"
    us-west-2 = "us-west-2a"
  }
}

variable "instance_type" {
  description = "The AWS instance type to launch"

  default = "p2.xlarge"
}

variable "tag_name" {
  description = "The tag to apply to all resources associated with this module"
  default = "aws-deep-learning"
}
