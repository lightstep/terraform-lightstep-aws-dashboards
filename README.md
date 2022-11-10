# Terraform Module for Lightstep AWS Dashboards

**:warning:** You are viewing a **beta version** of the official
module to create and manage AWS Dashboards inside Lightstep.

This is a Terraform module for deploying pre-defined set of AWS dashboards in Lightstep meant to be used with the [Lightstep Cloudwatch Metrics Streams integration](https://docs.lightstep.com/docs/setup-aws-for-metrics).

## Pre-requisites

* Lightstep account and API Key with `member` permissons.
* [Lightstep Cloudwatch Metrics Streams integration](https://docs.lightstep.com/docs/setup-aws-for-metrics) sending data to a Lightstep project.
* Terraform v1.0+

## Supported AWS Resources

Each AWS resource has an associated module that will create Lightstep dashboards to view Cloudwatch metrics. Currently, these resources are supported:

* __EC2__ (module: [`ec2-dashboard`](https://github.com/lightstep/terraform-lightstep-aws-dashboards/tree/master/modules/ec2-dashboard))
* __RDS__ (module: [`rds-dashboard`](https://github.com/lightstep/terraform-lightstep-aws-dashboards/tree/master/modules/rds-dashboard))
* __ECS__ (module: [`ecs-dashboard`](https://github.com/lightstep/terraform-lightstep-aws-dashboards/tree/master/modules/ecs-dashboard))
* __S3__ (module: [`s3-dashboard`](https://github.com/lightstep/terraform-lightstep-aws-dashboards/tree/master/modules/s3-dashboard))
* __DynamoDB__ (module: [`dynamodb-dashboard`](https://github.com/lightstep/terraform-lightstep-aws-dashboards/tree/master/modules/dynamodb-dashboard))
*  __Lambda__ (module: [`lambda-dashboard`](https://github.com/lightstep/terraform-lightstep-aws-dashboards/tree/master/modules/lambda-dashboard))
*  __Kinesis__ (module: [`kinesis-dashboard`](https://github.com/lightstep/terraform-lightstep-aws-dashboards/tree/master/modules/kinesis-dashboard))
*  __SQS__ (module: [`sqs-dashboard`](https://github.com/lightstep/terraform-lightstep-aws-dashboards/tree/master/modules/sqs-dashboard))
*  __SNS__ (module: [`sns-dashboard`](https://github.com/lightstep/terraform-lightstep-aws-dashboards/tree/master/modules/sns-dashboard))
* __API Gateway__ (module: [`apigateway-dashboard`](https://github.com/lightstep/terraform-lightstep-aws-dashboards/tree/master/modules/apigateway-dashboard))
* __Application ELB__ (module: [`applicationelb-dashboard`](https://github.com/lightstep/terraform-lightstep-aws-dashboards/tree/master/modules/applicationelb-dashboard))
* __ElastiCache (Redis)__ (module: [`elasticache-redis-dashboard`](https://github.com/lightstep/terraform-lightstep-aws-dashboards/tree/master/modules/elasticache-redis-dashboard))
* __EFS__ (module: [`efs-dashboard`](https://github.com/lightstep/terraform-lightstep-aws-dashboards/tree/master/modules/efs-dashboard))
* __Aurora__ (module: [`aurora-dashboard`](https://github.com/lightstep/terraform-lightstep-aws-dashboards/tree/master/modules/aurora-dashboard))
* __Route53__ (module: [`route53-dashboard`](https://github.com/lightstep/terraform-lightstep-aws-dashboards/tree/master/modules/route53-dashboard))
* __Inspector__ (module: [`inspector-dashboard`](https://github.com/lightstep/terraform-lightstep-aws-dashboards/tree/master/modules/inspector-dashboard))
* __NATGateway__ (module: [`natgateway-dashboard`](https://github.com/lightstep/terraform-lightstep-aws-dashboards/tree/master/modules/natgateway-dashboard))
* __Amplify__ (module: [`amplify-dashboard`](https://github.com/lightstep/terraform-lightstep-aws-dashboards/tree/master/modules/amplify-dashboard))
* __Backup__ (module: [`backup-dashboard`](https://github.com/lightstep/terraform-lightstep-aws-dashboards/tree/master/modules/backup-dashboard))
* __Chatbot__ (module: [`chatbot-dashboard`](https://github.com/lightstep/terraform-lightstep-aws-dashboards/tree/master/modules/chatbot-dashboard))
* __CloudHSM__ (module: [`cloudhsm-dashboard`](https://github.com/lightstep/terraform-lightstep-aws-dashboards/tree/master/modules/cloudhsm-dashboard))

## How to Use This Module

This repo has the following folder structure:

* [modules](https://github.com/lightstep/terraform-lightstep-aws-dashboards/tree/master/modules): This folder contains several standalone, reusable, modules that you can use to create different types of Lightstep dashboards for AWS resources.
* [examples](https://github.com/lightstep/terraform-lightstep-aws-dashboards/tree/master/examples): This folder shows examples of different ways to define creation of dashboards.
* [root folder](https://github.com/lightstep/terraform-lightstep-aws-dashboards/tree/master): The root folder is *an example* of how to use the [terraform-lightstep-aws-dashboards module](https://github.com/hashicorp/terraform-aws-consul/tree/master/modules/consul-cluster) 
  module to create Lightstep AWS Dashboards. The Terraform Registry requires the root of every repo to contain Terraform code, so we've put one of the examples there. This example is great for learning and experimenting, but for production use, please use the underlying modules in the [modules folder](https://github.com/lightstep/terraform-lightstep-aws-dashboards/tree/master/modules) directly.

To deploy create Lightstep dashboards for production using this repo:

- Ensure account meets module pre-requisites from above.

- Create a Terraform configuration that pulls module(s) and specifies values
  of the required variables.

- Run `terraform init` and `terraform apply` with your API Key set in the environment variable `LIGHTSTEP_API_KEY` (or the environment variable name you specified in configuration).

## Development

This repository uses `pre-commit` to format and lint HCL code.

To install:

```
    $ brew install pre-commit
    $ pre-commit install
```