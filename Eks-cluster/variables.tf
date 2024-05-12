variable "location" {
  default = "ap-south-1"
}

variable "key" {
  default = "task"
}

variable "instance-type" {
  default = "t2.medium"
}

variable "vpc-cidr" {
  default = "10.10.0.0/16"
}

variable "subnet1-cidr" {
  default = "10.10.1.0/24"

}

variable "subnet2-cidr" {
  default = "10.10.2.0/24"

}
variable "subent_az" {
  default = "ap-south-1a"
}

variable "subent_az-2" {
  default = "ap-south-1b"
}

variable "ingress_ports" {
  type = list(number)
  default = [ 443, 22, 8080, 9090, 3000, 9000, 9100, 9115, 30000, 32767 ]
}

 


