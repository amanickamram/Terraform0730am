output "private_ip_Dev" {
    value =aws_instance.devname.private_ip
}

output "public_ip_Dev" {
  value = aws_instance.devname.public_ip
}

output "availability_zone_Dev" {
value = aws_instance.devname.availability_zone
}

output "private_ip_test" {
    value =aws_instance.testname.private_ip
}

output "public_ip_test" {
  value = aws_instance.testname.public_ip
}

output "availability_zone_test" {
value = aws_instance.testname.availability_zone
}