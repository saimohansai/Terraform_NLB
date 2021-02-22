variable "pub-subnet-count" {}
variable "vpc_id" {}
variable "public_wait" {}



variable "Myimages" {
  default = {
      us-east-1 = "ami-0885b1f6bd170450c",
      us-east-2 = "ami-0a91cd140a1fc148a",
      us-west-1 = "ami-00831fc7c1e3ddc60"
    }
}

