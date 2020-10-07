terraform {
    required_version = ">= 0.13"
    backend "remote" {
        organization = "org-example"
        workspaces {
            name = "db-stage"
        }
    }
}

provider "aws" {
    region = "us-east-1"
}

module "db" {
    source = "github.com/muhannad0/terraform-example-module//modules/mysql-db?ref=v0.0.2"

    identifier = "db-stage"

    name = "example_db_stage"

    # use variables configured in TF Cloud Workspace
    username = var.db_user
    password = var.db_pass
    port = 3306
}
