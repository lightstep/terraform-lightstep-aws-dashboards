terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.88.0"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_elasticache_redis_dashboard" {
  project_name          = var.lightstep_project
  dashboard_name        = "AWS ElastiCache (Redis)"
  dashboard_description = "Monitor AWS ElastiCache (Redis) with this overview dashboard."

  chart {
    name = "Cache"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.elasti_cache.cache_hits_count | delta | group_by ["CacheClusterId"], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.elasti_cache.cache_misses_count | delta | group_by ["CacheClusterId"], sum
EOT
    }

  }

  chart {
    name = "Connections"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.elasti_cache.curr_connections_max | latest | group_by [], sum"
    }

    query {
      query_name   = "b"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.elasti_cache.new_connections_max | latest | group_by [], sum"
    }

  }

  chart {
    name = "Save In Progress / CurrItems"
    rank = "2"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.elasti_cache.save_in_progress_max | latest | group_by ["CacheClusterId"], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.elasti_cache.curr_items_max | latest | group_by ["CacheClusterId"], sum
EOT
    }

  }

  chart {
    name = "Bytes Used for Cache / Replication Bytes"
    rank = "3"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.elasti_cache.bytes_used_for_cache_max | latest | group_by ["CacheClusterId"], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.elasti_cache.replication_bytes_max | latest | group_by ["CacheClusterId"], sum
EOT
    }

  }

  chart {
    name = "Replication Lag"
    rank = "4"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.elasti_cache.replication_lag_max | latest | group_by ["CacheClusterId"], sum
EOT
    }

  }

  chart {
    name = "Database Memory Usage"
    rank = "5"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = "metric aws.elasti_cache.database_memory_usage_percentage_max | latest | group_by [], sum"
    }

  }

  chart {
    name = "CPU Utilization"
    rank = "6"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.elasti_cache.cpu_utilization_max | latest | group_by ["CacheClusterId"], sum
EOT
    }

  }

  chart {
    name = "Network"
    rank = "7"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.elasti_cache.network_bytes_in_max | latest | group_by ["CacheClusterId"], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.elasti_cache.network_bytes_out_max | latest | group_by ["CacheClusterId"], sum
EOT
    }

  }

}
