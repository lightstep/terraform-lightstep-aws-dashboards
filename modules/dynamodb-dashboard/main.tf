terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.91.1"
    }
  }
  required_version = ">= v1.0.11"
}


resource "lightstep_dashboard" "aws_dynamodb_dashboard" {
  project_name          = var.lightstep_project
  dashboard_name        = "AWS DynamoDB"
  dashboard_description = "Monitor DynamoDB with this overview dashboard."

  chart {
    name = "Request Latency Per Table"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.dynamo_db.successful_request_latency_max | latest | group_by ["TableName"], max
EOT
    }

  }

  chart {
    name = "Provisioned Read Capacity"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.dynamo_db.provisioned_read_capacity_units_count | delta | group_by ["TableName"], max
EOT
    }

  }

  chart {
    name = "Provisioned Write Capacity"
    rank = "2"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.dynamo_db.provisioned_write_capacity_units_count | delta | group_by ["TableName"], sum
EOT
    }

  }

  chart {
    name = "Read Capacity Utilization / Write Capacity Utilization"
    rank = "3"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.dynamo_db.account_provisioned_read_capacity_utilization_max | latest | group_by ["TableName"], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.dynamo_db.max_provisioned_table_write_capacity_utilization_max | latest | group_by ["TableName"], sum
EOT
    }

  }

  chart {
    name = "Returned Item Count per Table"
    rank = "4"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.dynamo_db.returned_item_count_count | delta | group_by ["TableName"], sum
EOT
    }

  }

  chart {
    name = "Max Table Reads (Account) / Max Table Writes (Account)"
    rank = "5"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.dynamo_db.account_max_table_level_reads_count | delta | group_by ["TableName"], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.dynamo_db.account_max_table_level_writes_count | delta | group_by ["TableName"], sum
EOT
    }

  }

  chart {
    name = "Account Max Reads / Account Max Writes"
    rank = "6"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.dynamo_db.account_max_reads_count | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.dynamo_db.account_max_writes_count | delta | group_by [], sum
EOT
    }

  }

}
