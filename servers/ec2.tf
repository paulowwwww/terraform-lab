resource "aws_instance" "instance_lab" {
  ami                     = var.ami_project
  instance_type           = var.instance_type_t2
  tenancy                 = "host"
  key_name                = var.key_ec2_name

  tags = {
    Name = "Ubuntu-Project"
  }

  vpc_security_group_ids = [ aws_security_group.ssh.id, aws_security_group.http.id, aws_security_group.https.id ]
}