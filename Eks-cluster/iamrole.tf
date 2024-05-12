#  Create IAM Role with AmazonEKSFullAccess policy for demo-server

resource "aws_iam_role" "eks_role" {
  name               = "eks-role"
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Service": "ec2.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "eks_policy_attachment" {
  name       = "eks-policy-attachment"
  roles      = [aws_iam_role.eks_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy" 
}

#  Associate IAM role with IAM instance profile

resource "aws_iam_instance_profile" "eks_instance_profile" {
  name = "eks-instance-profile"
  role = aws_iam_role.eks_role.name
}
