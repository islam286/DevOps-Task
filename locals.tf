locals {
  name   = "ex-${basename(path.cwd)}"
  region = "eu-east-1"
  vpc_cidr = "10.0.0.0/16"
  vpc_cidr_source = "0.0.0.0/0"
  azs      = slice(data.aws_availability_zones.available.names, 0, 2)
  
  ebs_csi_service_account_namespace = "kube-system"
  ebs_csi_service_account_name = "ebs-csi-controller-sa"

  tags = {
    terraform = "true"
    env  = "prod"
  }
}