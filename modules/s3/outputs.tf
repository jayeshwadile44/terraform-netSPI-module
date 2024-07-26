output "bucket_id" {
  value = aws_s3_bucket.netspi_bucket.id
}

output "ec2_s3_profile_name" {
  value = aws_iam_instance_profile.ec2_s3_profile.name
}