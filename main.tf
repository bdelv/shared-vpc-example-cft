locals {
  subnet_svc1_name = "subnet-svc1"
}

/******************************************
  Host Project Creation
 *****************************************/
module "host-project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 6.0"

  name              = "${var.prefix}-host"
  random_project_id = true

  org_id            = var.org_id
  folder_id         = var.folder_id
  billing_account   = var.billing_account
}

/******************************************
  Shared VPC
 *****************************************/
module "host-vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 2.1"

  project_id   = module.host-project.project_id
  network_name = "shared-vpc"

  shared_vpc_host = true

  subnets = [
      {
        subnet_name   = local.subnet_svc1_name
        subnet_ip     = "10.12.0.0/24"
        subnet_region = var.region
      },
    ]
}

/******************************************
  Service Project Creation
 *****************************************/
module "service1-project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 6.0"

  name              = "${var.prefix}-svc1"
  random_project_id = true

  org_id            = var.org_id
  folder_id         = var.folder_id
  billing_account   = var.billing_account

#  shared_vpc         = module.host-vpc.project_id
  shared_vpc         = module.host-project.project_id
  shared_vpc_subnets = [
    "https://www.googleapis.com/compute/v1/projects/${module.host-project.project_id}/regions/${var.region}/subnetworks/${local.subnet_svc1_name}",
  ]
}
