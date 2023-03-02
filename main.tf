terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.70.10"
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

module "lightstep_ecs_dashboard" {
  source            = "./modules/ecs-dashboard"
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

module "lightstep_sns_dashboard" {
  source            = "./modules/sns-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_dynamodb_dashboard" {
  source            = "./modules/dynamodb-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_apigateway_dashboard" {
  source            = "./modules/apigateway-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_elasticache_redis_dashboard" {
  source            = "./modules/elasticache-redis-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_s3_dashboard" {
  source            = "./modules/s3-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_efs_dashboard" {
  source            = "./modules/efs-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_msk_dashboard" {
  source            = "./modules/msk-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_route53_dashboard" {
  source            = "./modules/route53-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_cloudfront_dashboard" {
  source            = "./modules/cloudfront-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_inspector_dashboard" {
  source            = "./modules/inspector-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_natgateway_dashboard" {
  source            = "./modules/natgateway-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_amplify_dashboard" {
  source            = "./modules/amplify-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_cloudtrail_dashboard" {
  source            = "./modules/cloudtrail-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_backup_dashboard" {
  source            = "./modules/backup-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_chatbot_dashboard" {
  source            = "./modules/chatbot-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_cloudhsm_dashboard" {
  source            = "./modules/cloudhsm-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_chime_dashboard" {
  source            = "./modules/chime-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_eks_node_dashboard" {
  source            = "./modules/eks-node-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_eks_pod_dashboard" {
  source            = "./modules/eks-pod-dashboard"
  lightstep_project = var.lightstep_project
}
