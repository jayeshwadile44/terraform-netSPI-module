resource "aws_efs_file_system" "netspi_efs" {
  creation_token = "netspi-efs"
  
  tags = {
    Name = "NetSPI-EFS"
  }
}

resource "aws_efs_mount_target" "netspi_efs_mount" {
  file_system_id  = aws_efs_file_system.netspi_efs.id
  subnet_id       = var.subnet_id
  security_groups = [var.security_group_id]
}