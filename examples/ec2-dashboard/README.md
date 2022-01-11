# Lightstep AWS EC2 Dashboard Example

This folder shows an example of using Terraform code to create a dashboard in Lightstep for EC2 Instances using data from the [Lightstep Cloudwatch Metrics Streams integration](https://docs.lightstep.com/docs/setup-aws-for-metrics).

### Prerequisites

1. Configure the [Lightstep Cloudwatch Metrics Streams integration](https://docs.lightstep.com/docs/setup-aws-for-metrics) to send data to your Lightstep project.
2. Set your Lightstep API Key

```
export LIGHTSTEP_API_KEY=...
```

### Deployment

1. Initialize and apply the Terraform configuration

```
terraform init && terraform apply
```

### Viewing the dashboards

1. Open the URL specified in the output `lightstep_aws_ec2_dashboard_url` to see AWS EC2 data.