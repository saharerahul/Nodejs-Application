variable "vpc_id" {
   type = string
}

variable "ingress_portss" {
  type = list(number)
  default = [ 443, 22, 8080, 9090, 3000, 9000, 9100, 9115, 30000, 32767 ]
}
