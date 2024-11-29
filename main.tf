module "vpc" {

  source = "../terraform-modules/vpc"
  #  region       = var.region
  project_name    = var.project_name
  vpc_cidr        = var.vpc_cidr
  pub_sub_1a_cidr = var.pub_sub_1a_cidr
  pub_sub_1a      = var.pub_sub_1a
  #  pub_sub_1b      = var.pub_sub_1b
  #  pub_sub_2a      = var.pub_sub_2a
  #  pub_sub_2b      = var.pub_sub_2b
  #  sg-group-id  = var.sg-group-id

}

/* output "s-group-id" {

  value = module.vpc.sg-group-id
} */






module "ec2" {

  source = "../terraform-modules/ec2"

  ami-name  = module.ec2[0].ami-name
  inst-type = var.inst-type
  # pub_sub_1a_cidr = var.pub_sub_1a_cidr
  pub_sub_1a = module.vpc.pub_sub_1a_id
  #pub_sub_1b = var.pub_sub_1b
  #  pub_sub_2a = var.pub_sub_2a
  #  pub_sub_2b = var.pub_sub_2b
  s-group-id = module.vpc.sg-group-id

  count = 3

  /*  depends_on = [

    module.vpc
  ]*/
}
