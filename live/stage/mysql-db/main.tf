terraform {
    required_version = ">= 0.12"
    backend "remote" {
        organization = "org-example"
        workspaces {
            name = "example-architecture"
        }
    }
}

provider "aws" {
    region = "us-east-1"
}

module "db" {
    source = "github.com/muhannad0/terraform-example-module//modules/mysql-db?ref=v0.0.1"

    identifier = "stage"

    name = "example_db_stage"
    username = "user"
    password = var.db_pass
    port = 3306
}
