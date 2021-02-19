provider "aws" {
  region = "us-east-1"
}

# Dev

module "Dev_vpc" {
  source = "./module"
  vpc-cidr = "192.168.0.0/16"
  vpc-name = "Dev-vpc"
  Subnet-public="Dev-public"
  Subnet-private= "Dev-private"
  IGW_tag="Dev-IGW"
  NAT_tag="Dev-NAT"
  Public_rout="Dev-public-rout"
  Private_rout="Dev-private-rout"
  EIP_NAT = "Dev-NAT-EIP"
  public-file = "package_install"

  #public-jumpserver= "192.168.1.0/24"
  #my-region= "us-east-1"
}
//module "Dev_Ec2" {
//  source = "./module/my_Ec2"
//}
//module "T" {
//  source = ""
//}
//
//#Test
//
//module "Testing_Env" {
//  source = "./module/"
//}
//
//#prod
//module "Testing_Env" {
//  source = "./module/"
//}