////data "aws_subnet_ids" "subnets" {
////  vpc_id = var.vpc_id
////  tags = {
////    Tier = "Public"
////  }
////}
////data "aws_subnet" "subnet"{
////for_each =
////}
////data "aws_subnet" "subnetids" {
////  for_each = data.aws_subnet_ids.subnets.ids
////  id=each.value
////}
//
////data "aws_subnet_ids" "public-subnet-id" {
////  vpc_id = "${var.vpc_id}"
////  tags = {
////    Name= "all private-subnets"
////  }
////}
//  //resource "aws_instance" "private" {
//  //  #count = 1
//  //  count = length(aws_subnet.private)
//  //  ami = "${lookup(var.Myimages,"us-east-1")}"
//  //  instance_type = "t2.micro"
//  //  #availability_zone = "${element(var.azs,count.index)}"
//  //  subnet_id = aws_subnet.private[count.index].id
//  //  vpc_security_group_ids = ["${aws_security_group.Allow-all.id}"]
//  //  key_name = "Terraform"
//  //  user_data = "${file("package_install-${count.index}.sh")}"
//  //  #associate_public_ip_address = false
//  //  tags = {
//  //    Name = "private-.${count.index}"
//  //  }
//  //}
//data "aws_vpc" "my_vpc" {
//  tags = {
//    Name="Dev-vpc"
//  }
//}
//data "aws_subnet_ids" "public"{
//  vpc_id = "${var.vpc_id}"
////  tags = {
////    Tier = "Public"
////  }
//}
//
//  resource "aws_instance" "public" {
//    #depends_on = ["data.aws_subnet_ids.public"]
//    #depends_on = ["${}"]
//    count = 3
//    #count = length("${data.aws_subnet_ids.public.ids}")
//    #for_each = "${data.aws_subnet_ids.public.ids}"
//    #count = var.pub-subnet-count
//    ami = "${lookup(var.Myimages,"us-east-1")}"
//    instance_type = "t2.micro"
//    #availability_zone = "${element(var.azs,count.index)}"
//    subnet_id = "${element(data.aws_subnet_ids.public.ids,count.index)}"
//    #subnet_id =eledata.aws_subnet_ids.public.ids[count.index]
//     #subnet_id =each.value
//    #subnet_id = data.aws_subnet_ids.subnets[count.index].id
//    #subnet_id = aws_subnet.public[count.index].id
//    #vpc_security_group_ids = ["${aws_security_group.Allow-all.id}"]
//    key_name = "Terraform"
//    #user_data = "${file("module/package_install-${count.index}.sh")}"
//    #"Personal-Private-${count.index}"
//    #associate_public_ip_address = true
//    tags = {
//       #Name = "private-.${count.index}"
//        Name = "public"
//     }
//  }
//
