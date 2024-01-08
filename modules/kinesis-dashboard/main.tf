terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.86.0"
    }
  }
  required_version = ">= v1.0.11"
}


resource "lightstep_dashboard" "aws_kinesis_dashboard" {
  project_name          = var.lightstep_project
  dashboard_name        = "AWS Kinesis"
  dashboard_description = ""

  chart {
    name = "Incoming Records / Incoming Bytes"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.kinesis.incoming_records_sum | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.kinesis.incoming_bytes_sum | delta | group_by [], sum
EOT
    }

  }

  chart {
    name = "Get Records / Get Records Latency"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.kinesis.get_records_records_count | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.kinesis.get_records_latency_max | latest | group_by [], sum
EOT
    }

  }

  chart {
    name = "Get Records Success"
    rank = "2"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.kinesis.get_records_success_count | delta | group_by [], sum
EOT
    }

  }

  chart {
    name = "Read Provisioned Throughput Exceeded / Write Provisioned Throughput Exceeded"
    rank = "3"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.kinesis.write_provisioned_throughput_exceeded_max | latest | group_by [], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.kinesis.read_provisioned_throughput_exceeded_max | latest | group_by [], sum
EOT
    }

  }

  chart {
    name = "Put Records / Put Record Latency"
    rank = "4"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.kinesis.put_records_total_records_count | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.kinesis.put_record_latency_max | latest | group_by [], sum
EOT
    }

  }

  chart {
    name = "Put Record Success"
    rank = "5"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.kinesis.put_record_success_count | delta | group_by [], sum
EOT
    }

  }

}

