resource "aws_s3_bucket" "default" {
    bucket = join("-", [var.bucket_name, "estudos", "terraform"])
    acl    = "private"

    tags = {
        Name        = var.bucket_name
        Environment = var.env
    }
}
