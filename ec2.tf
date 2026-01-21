// Creation of EC2 instance

resource "aws_instance" "server" {
  ami             = "ami-0befe889153750fc4"
  instance_type   = "t3.micro"
  subnet_id       = aws_subnet.public1.id
  key_name        = aws_key_pair.key1.key_name
  security_groups = [aws_security_group.web_sg.id]
  user_data       = file("setup.sh")
  tags = {
    Name = "Terraform-project-server"
    env  = "Dev"
  }
}
// EBS volume attachment
resource "aws_ebs_volume" "ebs" {
  availability_zone = aws_instance.server.availability_zone
  size              = 20 // size in GB
    tags = {
        Name = "Terraform-EBS-Volume"
    }
}
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.ebs.id
  instance_id = aws_instance.server.id
}
