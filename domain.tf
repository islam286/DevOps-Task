
resource "aws_route53_zone" "my_domain" {
  name = var.domain_name
}

resource "aws_route53_record" "web_app_record" {
  zone_id = aws_route53_zone.my_domain.zone_id
  name    = "www"  
  ttl     = "300"
  records = [module.eks.cluster_endpoint]  # Use the EKS cluster endpoint as the value
}

# Output the DNS name for the website
output "website_dns" {
  value = aws_route53_record.web_app_record.fqdn
}

resource "aws_acm_certificate" "web_app_ssl_cert" {
  domain_name       = var.domain_name # Replace with your actual domain name
  validation_method = "EMAIL"
}