provider "aws" {
 profile = "default"
 region ="us-west-2"   
}

provider "aws" {
 profile = "dev"
 region ="us-west-2"
 alias="DevProfile"   
}