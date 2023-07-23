# Assuming your web server instances are launched using the EC2 Auto Scaling Group created by the eks_managed_node_group module

data "external" "ssl_cert" {
  program = ["bash", "${path.module}/obtain_ssl_cert.sh"]
}

# Use the obtained SSL certificate from the external data source
resource "aws_lb_listener_certificate" "web_app_ssl_cert" {
  listener_arn    = aws_lb_listener.web_app_https.arn
  certificate_arn = data.external.ssl_cert.result.cert_arn
}


