terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = ">= 1.51.3"
    }
  }
  required_version = ">= v1.0.11"
}

provider "lightstep" {
  api_key_env_var = var.lightstep_api_key_env_var
  organization    = var.lightstep_organization
  environment     = var.lightstep_env
}

module "lightstep_ec2_dashboard" {
  # When using these modules in your own templates, you will need to use a Git URL with a ref attribute that pins you
  # to a specific version of the modules, such as the following example:
  # source = "git::git@github.com:lightstep/terraform-lightstep-aws-dashboards.git//modules/ec2-dashboard?ref=v0.0.1"
  source            = "../../modules/rds-dashboard"
  lightstep_project = var.lightstep_project
  aws_region        = "us-west-2"
}
