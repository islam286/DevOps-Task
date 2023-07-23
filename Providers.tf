
terraform {
  required_providers {
    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}


##################################################################################
# PROVIDERS
##################################################################################

provider "aws" {
  profile = "deep-dive"
  region  = var.region
}
provider "kubernetes" {
  config_path = "~/.kube/config" 
}
provider "kubectl" {
  config_path = "~/.kube/config"  # Path to your kubeconfig file
}


##################################################################################
# DATA
##################################################################################

data "aws_availability_zones" "available" {}
