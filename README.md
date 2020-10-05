# Terraform Example: 2-tier web application on AWS
This repo contains an example of using Terraform to deploy a 2-tier web application on AWS.

## Pre-Requisites
+ [Terraform](https://www.terraform.io/downloads.html) 0.12 or higher.
+ [Terraform Cloud](https://app.terraform.io/signup/account) account.
    + Follow [this guide](https://learn.hashicorp.com/tutorials/terraform/cloud-sign-up) to setup your Terraform Cloud account.
+ AWS account.

## Quick Start
+ Configure the remote backend organization and workspace values as setup in Terraform Cloud.
```
terraform {
    backend "remote" {
        organization = "org-example"
        workspaces {
            name = "example-architecture"
        }
    }
}
```

+ Deploy the database service (RDS MySQL).

+ Deploy the web application cluster (ASG).

+ *Commands used for above steps:*
```bash
terraform init
terraform plan
terraform apply
```

+ To clean up run `terraform destroy` in the respective folders for each service:
    + `live/stage/web-app`
    + `live/stage/mysql`

*Note: This example will deploy real resources to your AWS account. We have made every effort so that the resources qualify for [AWS Free Tier](https://aws.amazon.com/free/), but we are not responsible for any charges you may incur.*