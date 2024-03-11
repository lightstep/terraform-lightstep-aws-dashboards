terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.93.0"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_ecs_dashboard" {
  project_name          = var.lightstep_project
  dashboard_name        = "AWS ECS"
  dashboard_description = "Monitor AWS ECS with this summary dashboard."

  chart {
    name = "CPU Utilization"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.ecs.cpu_utilization_max | latest | group_by ["ClusterName"], sum
EOT
    }

  }

  chart {
    name = "Memory Utilization"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.ecs.memory_utilization_max | latest | group_by ["ClusterName"], sum
EOT
    }

  }

  chart {
    name = "CPU Reservation"
    rank = "2"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.ecs.cpu_reservation_max | latest | group_by ["ClusterName"], sum
EOT
    }

  }

  chart {
    name = "Memory Reservation"
    rank = "3"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.ecs.memory_reservation_max | latest | group_by [], sum
EOT
    }

  }

}
