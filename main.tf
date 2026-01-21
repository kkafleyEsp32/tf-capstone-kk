provider "aws" {
  region = "ap-south-1"
}
 
module "Vms_app1" {
  source = "git::https://github.com/kkafleyEsp32/kk-repo-1.git//ec2-instance?ref=main"
  region-1 = "ap-south-1"
  instance_type = "t3.micro"
  subnets = ["subnet-0a413d769fe98ba0b", "subnet-043f1f8151b681cca", "subnet-04f47a3252bdf06e6"]
  #Security_group = module.Security_group.op_sg_id
  web_sg = [module.Web_SG01.web_sg_id]
  num_of_vm = 1
  env = "dev"
  user_data = file("scripts/nginx.sh")
}

module "Web_SG01" {
  source = "git::https://github.com/Vishwanathms/tf-aws-modules-jan26.git//security-groups?ref=main"
  project = "Kishor"
  vpc_id = data.aws_vpc.default.id
}
 
data "aws_vpc" "default" {
  default = true
}

output "vm_private_ips01" {
  value = module.Vms_app1.vm_priv_pips
}