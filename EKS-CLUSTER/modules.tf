#creating modules 

module "sgs" {
  source = "./sg_eks"
  vpc_id = aws_vpc.demo-vpc.id
}

module "eks" {
  source     = "./eks"
  sg_ids     = module.sgs.security_group_public
  vpc_id     = aws_vpc.demo-vpc.id
  subnet_ids = [aws_subnet.demo_subnet-1.id, aws_subnet.demo_subnet-2.id]
}
