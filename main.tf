terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.76.0"
    }
  }
  required_version = ">= v1.0.11"
}

provider "lightstep" {
  api_key_env_var = var.cloud_observability_api_key_env_var
  organization    = var.cloud_observability_organization
  environment     = var.cloud_observability_env
}

module "cloud_observability_amplify_dashboard" {
  source                      = "./modules/amplify-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_apigateway_dashboard" {
  source                      = "./modules/apigateway-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_applicationelb_dashboard" {
  source                      = "./modules/applicationelb-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_athena_dashboard" {
  source                      = "./modules/athena-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_aurora_dashboard" {
  source                      = "./modules/aurora-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_autoscaling_dashboard" {
  source                      = "./modules/autoscaling-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_backup_dashboard" {
  source                      = "./modules/backup-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_certificatemanager_dashboard" {
  source                      = "./modules/certificatemanager-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_chatbot_dashboard" {
  source                      = "./modules/chatbot-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_chime_dashboard" {
  source                      = "./modules/chime-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_cloudfront_dashboard" {
  source                      = "./modules/cloudfront-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_cloudhsm_dashboard" {
  source                      = "./modules/cloudhsm-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_cloudtrail_dashboard" {
  source                      = "./modules/cloudtrail-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_cognito_dashboard" {
  source                      = "./modules/cognito-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_dynamodb_dashboard" {
  source                      = "./modules/dynamodb-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_ebs_dashboard" {
  source                      = "./modules/ebs-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_ec2_dashboard" {
  source                      = "./modules/ec2-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_ecs_dashboard" {
  source                      = "./modules/ecs-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_efs_dashboard" {
  source                      = "./modules/efs-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_eks_node_dashboard" {
  source                      = "./modules/eks-node-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_eks_pod_dashboard" {
  source                      = "./modules/eks-pod-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_elasticache_redis_dashboard" {
  source                      = "./modules/elasticache-redis-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_elasticmapreduce_dashboard" {
  source                      = "./modules/elasticmapreduce-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_eventbridge_dashboard" {
  source                      = "./modules/eventbridge-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_inspector_dashboard" {
  source                      = "./modules/inspector-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_kinesis_dashboard" {
  source                      = "./modules/kinesis-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_lambda_dashboard" {
  source                      = "./modules/lambda-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_msk_dashboard" {
  source                      = "./modules/msk-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_msk_topic_dashboard" {
  source                      = "./modules/msk-topic-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_natgateway_dashboard" {
  source                      = "./modules/natgateway-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_networkfirewall_dashboard" {
  source                      = "./modules/networkfirewall-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_rds_dashboard" {
  source                      = "./modules/rds-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_redshift_dashboard" {
  source                      = "./modules/redshift-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_route53_dashboard" {
  source                      = "./modules/route53-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_s3_dashboard" {
  source                      = "./modules/s3-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_ses_dashboard" {
  source                      = "./modules/ses-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_sns_dashboard" {
  source                      = "./modules/sns-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_sqs_dashboard" {
  source                      = "./modules/sqs-dashboard"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_stepfunctions_dashboard" {
  source                      = "./modules/stepfunctions-dashboard"
  cloud_observability_project = var.cloud_observability_project
}
