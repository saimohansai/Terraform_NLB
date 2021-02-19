#https://medium.com/@sahityamaruvada/setting-up-aws-network-load-balancer-with-terraform-0-12-b87e75992949#d693
resource "aws_lb_target_group" "NLB_Target_group" {

  target_type = "instance"#lookup(var.test_tg_config,target_type )
  name = "Testing-NLB"
  protocol = "TCP"
  port = 80
  vpc_id = aws_vpc.my-aws.id
  tags = {
    Name="Nlb testing"
  }
}

resource "aws_alb_target_group_attachment" "NLB_target" {
  target_group_arn = aws_lb_target_group.NLB_Target_group.id
  count = length(aws_instance.public)
  target_id = aws_instance.public[count.index].id
  port = 80
}

resource "aws_eip" "my-eip" {
  count = length(aws_subnet.public)
  tags = {
    Name = "EIP-.${count.index}"
    #"Public-.${count.index}"
  }
}
//resource "aws_lb" "testing-NLB" {
//  load_balancer_type = "network"
//  name = "My-NLB"
//  #count=length(aws_subnet.public)
//  dynamic "subnet_mapping" {
//    for_each = ""
//    content {}
//  }
//  subnet_mapping {
//    subnet_id = aws_subnet.public
//    allocation_id = aws_eip.my-eip
//  }
//
//}
resource "aws_lb" "testing-NLB" {
  load_balancer_type = "network"
  name = "My-NLB"
  #count=length(aws_subnet.public)
  dynamic "subnet_mapping" {
      for_each = [ for i in range(length(aws_subnet.public)): {
          subnet_id = aws_subnet.public[i].id
          allocation_id = aws_eip.my-eip[i].id
      }]
    content {
      subnet_id = subnet_mapping.value.subnet_id #aws_subnet.public.id
      allocation_id = subnet_mapping.value.allocation_id #aws_eip.my-eip.id

    }
  }
}
resource "aws_lb_listener" "tg" {
  load_balancer_arn = aws_lb.testing-NLB.arn
  port = 80
  protocol = "TCP"
  default_action {
    target_group_arn = aws_lb_target_group.NLB_Target_group.arn
    type = "forward"
  }
}