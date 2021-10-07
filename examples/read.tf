terraform {
  required_providers {
    planetscale = {
      version = "0.3.1"
      source = "jubril.me/edu/planetscale"
    }
  }
}

variable "planetscale_token" {
  type = string
}


provider "planetscale" {
  access_token = var.planetscale_token
}
data "planetscale_databases" "all" {
  organization = "gophercorp"
}
data "planetscale_database" "one"{
  organization = "gophercorp"
  name = "express"
}

data "planetscale_organizations" "orgs" {
  
}

output "all_databases" {
  value = data.planetscale_databases.all.databases  
}

output "database" {
  value = data.planetscale_database.one.region
}
output "organizations" {
  value = data.planetscale_organizations.orgs.organizations
}

resource "planetscale_database" "primarydb"{
  organization = "gophercorp"
  name = "tftest"
}
