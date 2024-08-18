# provider.tf

# Default AWS Provider
provider "aws" {
  region = "eu-west-2"
}

# Aliased AWS Provider for us-east-1
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}
