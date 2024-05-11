resource "aws_security_group" "worker_node_sg" {
  name        = "eks-test"
  description = "Allow ssh inbound traffic"
  vpc_id      =  var.vpc_id

 dynamic "ingress" {
    for_each = var.ingress_portss
    iterator = port
    content {
        description      = "TLS from VPC"
        from_port        = port.value      
        to_port          = port.value
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

}