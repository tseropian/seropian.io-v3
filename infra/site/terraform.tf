terraform {
  backend "s3" {
    # Replace with your state bucket name and region
    bucket = "seropianio-v3-state"
    region = "eu-west-1"
    key    = "global/s3/terraform.tfstate"
  }
}

# Default region
provider "aws" {
  region  = "eu-west-1"
  version = "~> 2.59"
}

# us-east-1 region.  Do not change this!  It's needed to create the ACM
# certificate in us-east-1, the only region CloudFront can use them from
provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

provider "template" {
  version = "~> 2.1"
}