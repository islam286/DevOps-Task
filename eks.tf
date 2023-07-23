module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = "web-app-cluster-1"
  cluster_version = "1.27"

  cluster_endpoint_public_access  = true
  manage_aws_auth_configmap = true

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.public_subnets
  control_plane_subnet_ids = module.vpc.public_subnets

  # cluster_addons = {
  #   coredns = {
  #     most_recent = true
  #   }
    
  #   kube-proxy = {
  #     most_recent = true
  #   }
  #   vpc-cni = {
  #     most_recent = true
  #   }}
    # aws-ebs-csi-driver = {
    #   service_account_role_arn = module.ebs_csi_irsa_role.iam_role_arn
    #   most_recent = true
    # }
#   }


  aws_auth_roles = [
    {
      rolearn  = "arn:aws:iam::989152389096:role/AWSServiceRoleForAmazonEKS"
      username = "role1"
      groups   = ["system:masters"]
    },
  ]

  aws_auth_users = [
    {
      userarn  = "arn:aws:iam::989152389096:user/root"
      username = "root"
      groups   = ["system:masters"]
    },
    {
      userarn  = "arn:aws:iam::989152389096:user/islam"
      username = "islam"
      groups   = ["system:masters"]
    }
  ]

  aws_auth_accounts = [
    "989152389096"
  ]

  tags = {
    env = "prod"
    Terraform   = "true"
  }
}