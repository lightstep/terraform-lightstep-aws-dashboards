terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.89.0"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_ses_dashboard" {
  project_name          = var.lightstep_project
  dashboard_name        = "AWS SES"
  dashboard_description = "Monitor AWS SES with this dashboard."

  chart {
    name = "Send / Delivery"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.ses.send_sum | delta | group_by [], sum;
  b = metric aws.ses.send_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.ses.delivery_sum | delta | group_by [], sum;
  b = metric aws.ses.delivery_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "Bounce / Reject"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.ses.bounce_sum | delta | group_by [], sum;
  b = metric aws.ses.bounce_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.ses.reject_sum | delta | group_by [], sum;
  b = metric aws.ses.reject_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "Complaint"
    rank = "2"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.ses.complaint_sum | delta | group_by [], sum;
  b = metric aws.ses.complaint_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

}
