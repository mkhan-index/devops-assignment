# Production Environment Variables

aws_region         = "us-east-1"
project_name       = "go-app"
cluster_version    = "1.28"
vpc_cidr           = "10.2.0.0/16"  # Different CIDR for Production
availability_zones = ["us-east-1a", "us-east-1b"]

# Production environment uses larger, more nodes for high availability
node_instance_types = ["t3.medium"]
node_desired_size   = 3
node_min_size       = 2
node_max_size       = 6
node_disk_size      = 20

# Application configuration
app_namespace        = "default"
service_account_name = "app-serviceaccount"
