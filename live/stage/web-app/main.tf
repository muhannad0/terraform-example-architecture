terraform {
    required_version = ">= 0.13"
    backend "remote" {
        organization = "org-example"
        workspaces {
            name = "web-app-stage"
        }
    }
}

provider "aws" {
    region = "us-east-1"
}

# get db outputs from remote source
data "terraform_remote_state" "db_stage" {
    backend = "remote"
    config = {
        organization = "org-example"
        workspaces = {
            name = "db-stage"
        }
    }
}

module "web_app" {
    source = "github.com/muhannad0/terraform-example-module//modules/web-app?ref=v0.0.2"

    environment = "stage"

    instance_type = "t2.micro"
    min_size = 1
    max_size = 1
    desired_capacity = 1

    enable_autoscaling = false

    server_text = "Hello World Stage"

    # pass all output from db-dev to mysql_config
    mysql_config = data.terraform_remote_state.db_stage.outputs
}