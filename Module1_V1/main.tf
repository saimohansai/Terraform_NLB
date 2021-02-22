provider "aws" {
  region = "us-east-1"
}

# Dev

module "Dev_vpc" {
  source = "./module/my_vpc"
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

}

output "my_vpc_id" {
  value = "${module.Dev_vpc.subnet_cidr_blocks}"
}
//#resource "null_resource" "before" {}
//resource "null_resource" "delay" {
//
//  triggers = {
//    "lb_dns_name" = "${module.Dev_vpc}"
//    #"before" = "${module.Dev_vpc}"
//  }
//  provisioner "local-exec" {
//    command= "sleep 300"
//  }
//
//}
//resource "null_resource" "after" {
//depends_on = ["null_resource.delay"]
//}
//
//
//module "Dev_Ec2" {
// # depends_on = ["${modile.}""]
// # source = "./module/my_Ec2"
//#  vpc_id=module.Dev_vpc.VPC-id_output
//#  pub-subnet-count = module.Dev_vpc.public-subnet-count
//#  public_wait=module.Dev_vpc.public-wait
//
//  #pub-subnet-ids=module.Dev_vpc.subnetids-info
//}
////module "T" {
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

