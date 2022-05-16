
data "google_project" "project" {}

module "gke" {
  source = "../modules/gke"
  
}

module "sql" {
  source = "../modules/sql"
}

# Normally we would create TF state workspaces to separate the workloads as follows

#terraform {
#  backend "remote" {
#    organization = "example.com"
#    workspaces {
#      name = "platform"
#    }
#  }
#}
#

#data "terraform_remote_state" "platform_state" {
#  for_each = toset(["public-api", "private-api", "backend"])
#  backend  = "remote"
#  config = {
#    organization = "example.com"
#    workspaces = {
#      name = "${each.value}-prod"
#    }
#  }
#}

