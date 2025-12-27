variable "ec2_instance_type" {
  default = "t2.micro"
  type    = string

}
variable "ec2_default_root_storages_size" {
  default = 10
  type    = number

}
variable "ec2_ami_id" {
  default = "ami-02b8269d5e85954ef" #ubuntu 20.04 in ap-south-1
  type    = string

}

variable "env" {
  default = "prd"
  type = string 
  
}