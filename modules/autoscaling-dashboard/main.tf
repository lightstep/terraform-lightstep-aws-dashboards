terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.92.0"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_autoscaling_dashboard" {
  project_name          = var.lightstep_project
  dashboard_name        = "AWS AutoScaling"
  dashboard_description = "Monitor AWS AutoScaling with this dashboard."

  chart {
    name = "Instances"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.autoscaling.group_total_instances_sum | delta | group_by [], sum;
  b = metric aws.autoscaling.group_total_instances_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.autoscaling.group_desired_capacity_sum | delta | group_by [], sum;
  b = metric aws.autoscaling.group_desired_capacity_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "c"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.autoscaling.group_in_service_instances_sum | delta | group_by [], sum;
  b = metric aws.autoscaling.group_in_service_instances_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "d"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.autoscaling.group_max_size_sum | delta | group_by [], sum;
  b = metric aws.autoscaling.group_max_size_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "e"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.autoscaling.group_min_size_sum | delta | group_by [], sum;
  b = metric aws.autoscaling.group_min_size_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "f"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.autoscaling.group_pending_instances_sum | delta | group_by [], sum;
  b = metric aws.autoscaling.group_pending_instances_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "g"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.autoscaling.group_standby_instances_sum | delta | group_by [], sum;
  b = metric aws.autoscaling.group_standby_instances_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "h"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.autoscaling.group_terminating_instances_sum | delta | group_by [], sum;
  b = metric aws.autoscaling.group_terminating_instances_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

}
