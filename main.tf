module "vpc" {
  source = "./modules/vpc"

  project_name         = var.project_name
  aws_region           = var.aws_region
  common_tags          = var.common_tags
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}


module "route53" {
  source       = "./modules/route53"
  project_name = var.project_name
  domain_name  = var.domain_name
  common_tags  = var.common_tags

  a_records = [
    {
      name    = var.domain_name
      ttl     = 300
      records = ["1.2.3.4"]
    }
  ]

  cname_records = [
    {
      name  = "www"
      ttl   = 300
      value = var.domain_name
    }
  ]

  txt_records = [
    {
      name    = "_verify"
      ttl     = 300
      records = ["some-verification-token"]
    }
  ]

  mx_records = [
    {
      name    = var.domain_name
      ttl     = 300
      records = ["10 mail.${var.domain_name}"]
    }
  ]
}
