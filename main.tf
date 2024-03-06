terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.92.0"
    }
  }
  required_version = ">= v1.0.11"
}

provider "lightstep" {
  api_key_env_var = var.lightstep_api_key_env_var
  organization    = var.lightstep_organization
  environment     = var.lightstep_env
}

module "lightstep_amplify_dashboard" {
  source            = "./modules/amplify-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_apigateway_dashboard" {
  source            = "./modules/apigateway-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_applicationelb_dashboard" {
  source            = "./modules/applicationelb-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_athena_dashboard" {
  source            = "./modules/athena-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_aurora_dashboard" {
  source            = "./modules/aurora-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_autoscaling_dashboard" {
  source            = "./modules/autoscaling-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_backup_dashboard" {
  source            = "./modules/backup-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_certificatemanager_dashboard" {
  source            = "./modules/certificatemanager-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_chatbot_dashboard" {
  source            = "./modules/chatbot-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_chime_dashboard" {
  source            = "./modules/chime-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_cloudfront_dashboard" {
  source            = "./modules/cloudfront-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_cloudhsm_dashboard" {
  source            = "./modules/cloudhsm-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_cloudtrail_dashboard" {
  source            = "./modules/cloudtrail-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_cognito_dashboard" {
  source            = "./modules/cognito-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_dynamodb_dashboard" {
  source            = "./modules/dynamodb-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_ebs_dashboard" {
  source            = "./modules/ebs-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_ec2_dashboard" {
  source            = "./modules/ec2-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_ecs_dashboard" {
  source            = "./modules/ecs-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_efs_dashboard" {
  source            = "./modules/efs-dashboard"
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

module "lightstep_elasticache_redis_dashboard" {
  source            = "./modules/elasticache-redis-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_elasticmapreduce_dashboard" {
  source            = "./modules/elasticmapreduce-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_eventbridge_dashboard" {
  source            = "./modules/eventbridge-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_inspector_dashboard" {
  source            = "./modules/inspector-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_kinesis_dashboard" {
  source            = "./modules/kinesis-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_lambda_dashboard" {
  source            = "./modules/lambda-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_msk_dashboard" {
  source            = "./modules/msk-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_msk_topic_dashboard" {
  source            = "./modules/msk-topic-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_natgateway_dashboard" {
  source            = "./modules/natgateway-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_networkfirewall_dashboard" {
  source            = "./modules/networkfirewall-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_rds_dashboard" {
  source            = "./modules/rds-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_redshift_dashboard" {
  source            = "./modules/redshift-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_route53_dashboard" {
  source            = "./modules/route53-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_s3_dashboard" {
  source            = "./modules/s3-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_ses_dashboard" {
  source            = "./modules/ses-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_sns_dashboard" {
  source            = "./modules/sns-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_sqs_dashboard" {
  source            = "./modules/sqs-dashboard"
  lightstep_project = var.lightstep_project
}

module "lightstep_stepfunctions_dashboard" {
  source            = "./modules/stepfunctions-dashboard"
  lightstep_project = var.lightstep_project
}
