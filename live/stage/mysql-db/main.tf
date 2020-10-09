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

# Using AWS Secrets Manager to retrieve credentials
data "aws_secretsmanager_secret_version" "db_creds" {
    count = var.db_creds == null ? 1 : 0
    secret_id = "db-creds-example"
}

locals {
    db_creds = (
        var.db_creds == null ? jsondecode(data.aws_secretsmanager_secret_version.db_creds[0].secret_string) : var.db_creds
    )
    
    # Using TF Cloud Variable only
    # db_creds = var.db_creds
}

module "db" {
    source = "github.com/muhannad0/terraform-example-module//modules/mysql-db?ref=v0.0.2"

    identifier = "db-stage"

    name = "example_db_stage"
    
    username = local.db_creds.username
    password = local.db_creds.password
    port = 3306
}
