#!/bin/bash

# Replace with your actual domain name
DOMAIN="<your_domain>"

# Replace with your actual email address for certificate registration
EMAIL="your_email@example.com"

# Install Certbot (adjust depending on your Linux distribution)
# Example for Amazon Linux 2:
sudo yum install certbot python2-certbot-nginx -y

# Obtain the SSL certificate and register it using Certbot
sudo certbot certonly --standalone -d "$DOMAIN" --non-interactive --agree-tos --email "$EMAIL"

# Export the certificate ARN for Terraform to use
# This assumes you are using AWS Certificate Manager (ACM) for the SSL certificate
CERT_ARN=$(aws acm import-certificate \
  --certificate fileb:///etc/letsencrypt/live/$DOMAIN/cert.pem \
  --private-key fileb:///etc/letsencrypt/live/$DOMAIN/privkey.pem \
  --certificate-chain fileb:///etc/letsencrypt/live/$DOMAIN/fullchain.pem \
  --query 'CertificateArn' --output text)

# Output the certificate ARN for Terraform to use
echo "{\"cert_arn\": \"$CERT_ARN\"}"
