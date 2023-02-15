locals {
    env                 = "dev"
    bucket_name         = "pauloshawn"
    aws_region          = "us-east-1"
    access_key          = "AKIA36WHQPRT4KWG3X23"
    secret_access_key   = "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" 
    instance_type_t2    = "t2.micro"
    ami_project         = ""
    key_ec2_name        = "aws-class-2"
    vpcCIDRblock        = "10.0.0.0/16"
    subnetCIDRpublic    = "10.0.1.0/24"
    AvailabilityZone    = "us-east-1a"

}

module "s3" {
    source = "./s3-module"
    aws_region         = local.aws_region
    env                = local.env
    bucket_name        = local.bucket_name
    access_key         = local.access_key
    secret_access_key  = local.secret_access_key
    
}

module "servers" {
    source = "./s3-module"
    instance_type_t2 = local.instance_type_t2
    ami_project      = local.ami_project
    key_ec2_name     = local.key_ec2_name
    AvailabilityZone = local.AvailabilityZone
    vpcCIDRblock     = local.vpcCIDRblock
    subnetCIDRpublic = local.subnetCIDRpublic

  
}