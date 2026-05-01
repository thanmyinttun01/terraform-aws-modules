# 1. Build the Network
module "networking" {
  # Replace with your actual CodeCommit repository URL
  source = "git::https://git-codecommit.ap-southeast-1.amazonaws.com/v1/repos/terraform-aws-modules//vpc?ref=v1.0.0"


  environment = "prod"
  vpc_cidr    = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
}

# 2. Build the Server inside the Network
module "compute" {
  # Replace with your actual CodeCommit repository URL
  source = "git::https://git-codecommit.ap-southeast-1.amazonaws.com/v1/repos/terraform-aws-modules//ec2?ref=v1.0.0"

  environment   = "prod"
  instance_type = "t2.micro"

  # Injecting outputs from the networking module
  vpc_id    = module.networking.vpc_id
  subnet_id = module.networking.public_subnet_id
}
