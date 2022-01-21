terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = ">= 1.51.1"
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
  source            = "./modules/ec2-dashboard"
  lightstep_project = var.lightstep_project
  aws_region        = "us-west-2"
}

module "lightstep_rds_dashboard" {
  source            = "./modules/rds-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_app_elb_dashboard" {
  source            = "./modules/applicationelb-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_lambda_dashboard" {
  source            = "./modules/lambda-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_kinesis_dashboard" {
  source            = "./modules/kinesis-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_sqs_dashboard" {
  source            = "./modules/sqs-dashboard"
  lightstep_project = var.lightstep_project
}