# QA Environment Variables

aws_region         = "us-east-1"
project_name       = "go-app"
cluster_version    = "1.28"
vpc_cidr           = "10.1.0.0/16"  # Different CIDR for QA
availability_zones = ["us-east-1a", "us-east-1b"]

# QA environment uses medium-sized nodes
node_instance_types = ["t3.medium"]
node_desired_size   = 2
node_min_size       = 2
node_max_size       = 4
node_disk_size      = 20

# Application configuration
app_namespace        = "default"
service_account_name = "app-serviceaccount"
