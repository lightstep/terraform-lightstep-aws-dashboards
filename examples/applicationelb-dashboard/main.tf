terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.84.2"
    }
  }
  required_version = ">= v1.0.11"
}

provider "lightstep" {
  api_key_env_var = var.cloud_observability_api_key_env_var
  organization    = var.cloud_observability_organization
  environment     = var.cloud_observability_env
}

module "lightstep_applicationelb_dashboard" {
  # When using these modules in your own templates, you will need to use a Git URL with a ref attribute that pins you
  # to a specific version of the modules, such as the following example:
  # source = "git::git@github.com:lightstep/terraform-lightstep-aws-dashboards.git//modules/ec2-dashboard?ref=v0.0.1"
  source                      = "../../modules/applicationelb-dashboard"
  cloud_observability_project = var.cloud_observability_project
}
