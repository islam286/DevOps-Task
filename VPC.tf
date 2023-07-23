
##################################################################################
# RESOURCES
##################################################################################

# NETWORKING #
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"


  name = "Widebot-app"

  cidr            = var.cidr_block
  azs             = local.azs
  private_subnets = [for k, v in local.azs : cidrsubnet(var.cidr_block, 8, k)]
  public_subnets  = [for k, v in local.azs : cidrsubnet(var.cidr_block, 8, k + 100)]

  enable_nat_gateway = false

  map_public_ip_on_launch = true

  tags = {
    Environment = "Production"
  }
}