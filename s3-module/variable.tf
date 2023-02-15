variable "access_key" {
    type = string
    description = "access key for create resource on aws"
}

variable "secret_access_key" {
    type = string
    description = "secret key for create resource on aws"
}

variable "aws_region" {
    type = string
    description = "aws region"
}

variable "bucket_name" {
    type = string
    description = ""
  
}

variable "env" {
    type = string
    description = ""
}

variable "ami_project" {
    type = string
    description = "AMI for Medicine Project"
  
}

variable "instance_type_t2" {
    type = string
    description = "T2 instance"
}

variable "key_ec2_name" {
    type = string
    description = "key name"
}

variable "vpcCIDRblock" {
    type = string
    description = "vpc"
}

variable "subnetCIDRpublic" {
    type = string
    description = "subnet ip public"
  
}

variable "AvailabilityZone" {
    type = string
    description = "avlb subnet region"
  
}

