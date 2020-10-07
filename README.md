# Terraform Example: 2-tier web application on AWS
This repo contains an example of using Terraform to deploy a 2-tier web application on AWS using [pre-configured modules](https://github.com/muhannad0/terraform-example-module).

[Terraform Cloud](https://www.hashicorp.com/products/terraform) is used to maintain remote state and provision infrastructure.

## Pre-Requisites
+ [Terraform](https://www.terraform.io/downloads.html) 0.12 or higher.
+ [Terraform Cloud](https://app.terraform.io/signup/account) account.
    + Follow [this guide](https://learn.hashicorp.com/tutorials/terraform/cloud-sign-up) to setup your Terraform Cloud account.
+ AWS account.

## Quick Start
+ Create the required organization and workspaces in Terraform Cloud.
    + Ensure you have [configured each workspace](https://learn.hashicorp.com/tutorials/terraform/cloud-workspace-configure?in=terraform/cloud-get-started) with your AWS credentials.

+ Configure the remote backend for each service with the values setup in Terraform Cloud.
```
terraform {
    backend "remote" {
        organization = "org-example"
        workspaces {
            name = "service-environment"
        }
    }
}
```

+ Deploy the database service (MySQL RDS).
    + Ensure you have configured Terraform variables for `db_user` and `db_pass` in the respective Terraform Cloud workspace.

+ Deploy the web application cluster (ASG + ALB).
    + Provide config details for the database workspace to query and get the remote state.

+ *Commands used for above steps (using CLI-driven workflow):*
```bash
terraform init
terraform apply
```

+ To clean up run `terraform destroy` in the respective workspaces/folders for each service:


*Note: This example will deploy real resources to your AWS account. We have made every effort so that the resources qualify for [AWS Free Tier](https://aws.amazon.com/free/), but we are not responsible for any charges you may incur.*
