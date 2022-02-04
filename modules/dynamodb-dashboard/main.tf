terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "1.51.6"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_dashboard" "aws_dynamodb_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS DynamoDB"

  chart {
    name = "Request Latency Per Table"
    rank = "0"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.dynamo_db.successful_request_latency_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["TableName", ]
      }

    }

  }

  chart {
    name = "Provisioned Read Capacity"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.dynamo_db.provisioned_read_capacity_units_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "max"
        keys               = ["TableName", ]
      }

    }

  }

  chart {
    name = "Provisioned Write Capacity"
    rank = "2"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.dynamo_db.provisioned_write_capacity_units_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Read Capacity Utilization / Write Capacity Utilization"
    rank = "3"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.dynamo_db.account_provisioned_read_capacity_utilization_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.dynamo_db.max_provisioned_table_write_capacity_utilization_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Returned Item Count per Table"
    rank = "4"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.dynamo_db.returned_item_count_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["TableName", ]
      }

    }

  }

  chart {
    name = "Max Table Reads (Account) / Max Table Writes (Account)"
    rank = "5"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.dynamo_db.account_max_table_level_reads_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.dynamo_db.account_max_table_level_writes_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Account Max Reads / Account Max Writes"
    rank = "6"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.dynamo_db.account_max_reads_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.dynamo_db.account_max_writes_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

}