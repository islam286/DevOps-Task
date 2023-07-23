# DevOps Task: Provisioning Infrastructure as a code with terraform for Web Applications and Databases (MongoDB, SQL Server) and Redis for caching, with Domain Name, Certificate, and Load Balancer, Using docker and Kubernetes.

This Terraform project automates the provisioning and deployment of an Amazon Elastic Kubernetes Service (EKS) cluster in AWS. It also includes the deployment of Kubernetes manifests to configure the cluster according to your application's requirements. Below is an overview of the project's files and their functionalities:

## File Structure
```
.
├── domain.tf
├── eks.tf
├── kubernetes_manifests/
│ ├── web_app_manifest.yaml
│ ├── web_app_service.yaml
│ ├── sqlserver_statefulset.yaml
│ ├── sqlserver_service.yaml
│ ├── redis_statefulset.yaml
│ ├── redis_service.yaml
│ ├── mongodb_statefulset.yaml
│ └── mongodb_service.yaml
├── locals.tf
├── manifest.tf
├── obtain_ssl_cert.sh
├── providers.rf
├── security.tf
├── ssl.tf
├── variables.tf
└── vpc.tf
```

## Prerequisites

Before running this Terraform project, ensure you have the following prerequisites:

1. An AWS account with appropriate permissions to create resources like VPC, EKS cluster, and EC2 instances.
2. Terraform installed on your local machine.
3. AWS CLI installed and configured with proper credentials.
4. An existing Kubernetes configuration (kubeconfig) file pointing to the desired Kubernetes cluster.

## Configuration Files

### vpc.tf

This file defines the networking components for the EKS cluster. It uses the `terraform-aws-modules/vpc/aws` module to create a VPC with public and private subnets. The VPC spans multiple availability zones (`azs`) in the specified CIDR block (`cidr_block`).

### variables.tf

In this file, you can define the variables used throughout the Terraform configuration. The provided variables are as follows:

- `region`: The AWS region where the resources will be provisioned. Default value: `us-east-1`.
- `subnet_count`: The number of subnets to create in each availability zone. Default value: `2`.
- `cidr_block`: The CIDR block for the VPC. Default value: `10.0.0.0/16`.
- `domain_name`: The desired domain name for your application.

Feel free to adjust these variables according to your requirements.

### providers.rf

The providers file configures the necessary providers required for this project:

- `aws`: The AWS provider used to create AWS resources like VPC, subnets, etc.
- `kubernetes`: The Kubernetes provider that interacts with the EKS cluster to deploy Kubernetes manifests.
- `kubectl`: The provider to interact with kubectl, which allows deploying Kubernetes manifests from the local machine.

### locals.tf

This file defines local variables used within the Terraform configuration. It includes variables for the VPC and tags associated with the resources.

### eks.tf

This file provisions the EKS cluster using the `terraform-aws-modules/eks/aws` module. It configures the cluster name, version, VPC, subnets, and other essential settings.

### node_groups.tf

This file creates a managed node group for the EKS cluster using the `terraform-aws-modules/eks/aws//modules/eks-managed-node-group` module. It specifies the instance types, desired capacity, and other settings for the worker nodes.

### manifests.tf

This file deploys the Kubernetes manifests to the EKS cluster using the `kubectl_manifest` resource. It reads the YAML files from the `kubernetes_manifests/` directory and applies them to the cluster.

### security.tf

This file defines the security groups for the web servers, Redis, MongoDB, and SQL Server instances. It allows traffic between these resources as required for your application.

### domain.tf

This file manages the Route 53 zone and DNS record for your domain. It uses ACM to obtain an SSL certificate for the domain.

### ssl.tf

This file obtains an SSL certificate for your domain using Certbot and exports the certificate ARN to be used by Terraform.

### obtain_ssl_cert.sh

This shell script is used by the `ssl.tf` file to obtain an SSL certificate using Certbot.

### kubernetes_manifests/

This directory contains the Kubernetes manifest files that will be deployed to the EKS cluster. You can place all your YAML files for different services and resources in this directory.

## Running the Terraform Project

Follow these steps to provision and deploy the EKS cluster and Kubernetes manifests:

1. Ensure you have met all the prerequisites mentioned above.

2. Clone this Terraform project to your local machine.

3. Navigate to the project directory:
```
cd /path/to/your/terraform_project
```

4. Initialize the Terraform configuration:
```
terraform init
```
5. Review the Terraform plan to see the resources that will be created:
```
terraform plan
```

6. If the plan looks good, apply the configuration:
```
terraform apply
```

7. Terraform will create the necessary resources on
## Customization

This Terraform project is designed to work with the provided default configurations. However, you can customize it to fit your specific requirements. Here are some ways you can customize the project:

1. Adjust Variables: In the `variables.tf` file, you can modify the default values of variables such as the AWS region, VPC CIDR block, number of subnets, domain name, etc.

2. Kubernetes Manifests: The `kubernetes_manifests/` directory contains YAML files for deploying Kubernetes resources. You can modify these files or add new ones to deploy additional services or applications.

3. SSL Certificate: By default, the project uses Certbot to obtain an SSL certificate for your domain. If you have an existing SSL certificate, you can modify the `ssl.tf` file to use your certificate ARN directly.

4. Worker Nodes: The `node_groups.tf` file configures the managed node group for the EKS cluster. You can modify the instance types, capacity, and other settings based on your application's resource requirements.

## Security Considerations

- The Terraform project provisions resources in your AWS account. Ensure that you have proper access control and security measures in place to protect your infrastructure.

- When deploying Kubernetes manifests, ensure that sensitive data like secrets and credentials are properly encrypted and managed. Use Kubernetes secrets or other secure methods to store such information.

- Regularly review and update security group rules to limit unnecessary access and ensure that only required ports are open.

## Troubleshooting

If you encounter any issues while running this Terraform project, consider the following troubleshooting steps:

1. Verify Prerequisites: Ensure that you have met all the prerequisites, including proper AWS credentials, Terraform installation, and a valid kubeconfig file.

2. Check Terraform Output: After running `terraform apply`, carefully review the output to check for any errors or warnings. It provides valuable information about the resources created.

3. Examine Terraform Logs: If needed, examine the Terraform logs to get detailed information about the resource provisioning process.

4. Check Kubernetes Logs: If there are issues with Kubernetes resources, use `kubectl logs` and `kubectl describe` commands to troubleshoot pods and services.

5. Review IAM Permissions: Ensure that the IAM roles and policies associated with the EKS cluster and worker nodes have the necessary permissions to access AWS resources.

## Contributing

If you would like to contribute to this project, feel free to fork the repository

## Contact

- [Islam](mailto:islam.ibrahim6771@gmail.com)

Happy Terraforming and Kubernetes Deploying!


