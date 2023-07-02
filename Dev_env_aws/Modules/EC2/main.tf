/*resource "aws_key_pair" "auth" {
  key_name   = "key"
  public_key = file("~/.ssh/iackey.pub")
}
*/

resource "aws_instance" "app_instance" {
  ami                = data.aws_ami.server_ami.id
  instance_type          = var.aws_instance_type
  /* key_name               = aws_key_pair.auth.id */
  vpc_security_group_ids = [var.vpc_security_group_id]
  subnet_id              = var.public_subnet_az1_id

  tags = {
    Name = "${var.project_name}-ec2"
  }
  
  root_block_device {
    volume_size = var.root_block_device_size
  }
}