variable "azs" {
  description = "availability zones"
  type = list(string)
  default = ["us-east-1a","us-east-1b","us-east-1c"]
}

variable "azs_cidr" {
  description = "CIDR BLOCK FOR SUBNET"
  type = list(string)
  default = ["192.168.2.0/24","192.168.3.0/24","192.168.4.0/24"]
}
variable "vpc-cidr"{}
variable "vpc-name" {}
variable "public-jumpserver" {}
variable "my-region" {}

variable "Myimages" {
  default = {
      us-east-1 = "ami-0885b1f6bd170450c",
      us-east-2 = "ami-0a91cd140a1fc148a",
      us-west-1 = "ami-00831fc7c1e3ddc60"
    }
}

# variables.tf
variable "test_nlb_config" {
  default = {
    name            = "test-nlb"
    internal        = "false"
    environment     = "test"
    #subnet          = <subnet_id>
    #nlb_vpc_id      = <vpc_id>
  }
}
variable "test_tg_config" {
  default = {
    name                              = "test-nlb-tg"
    target_type                       = "instance"
    health_check_protocol             = "TCP"
    #tg_vpc_id                         = <tg_creation_vpc_id>
    #target_id1                        = <one of instance_id/ip/arn>
  }
}
variable "test_forwarding_config" {
  default = {
      80        =   "TCP"
      443       =   "TCP" # and so on
  }
}
//
//variable "tg_config" {
//  type = "map"
//}