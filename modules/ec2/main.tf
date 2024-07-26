resource "aws_instance" "netspi_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y amazon-efs-utils
              mkdir -p /data/test
              mount -t efs ${var.efs_id}:/ /data/test
              echo '${var.efs_id}:/ /data/test efs defaults,_netdev 0 0' >> /etc/fstab
              EOF

  iam_instance_profile = var.iam_instance_profile

  tags = {
    Name = "NetSPI-EC2"
  }
}