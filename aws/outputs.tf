output "server_address" {
  value = "${aws_instance.deep_learning.public_dns}"
}
