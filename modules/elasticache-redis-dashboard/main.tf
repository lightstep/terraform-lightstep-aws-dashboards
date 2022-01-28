terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = ">= 1.51.2"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_dashboard" "aws_elasticache_redis_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS ElastiCache (Redis)"

  chart {
    name = "Cache"
    rank = "0"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.elasti_cache.cache_hits_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["CacheClusterId", ]
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.elasti_cache.cache_misses_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["CacheClusterId", ]
      }

    }

  }

  chart {
    name = "Connections"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.elasti_cache.curr_connections_max"
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

      metric              = "aws.elasti_cache.new_connections_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Save In Progress / CurrItems"
    rank = "2"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.elasti_cache.save_in_progress_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = ["CacheClusterId", ]
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.elasti_cache.curr_items_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = ["CacheClusterId", ]
      }

    }

  }

  chart {
    name = "Bytes Used for Cache / Replication Bytes"
    rank = "3"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.elasti_cache.bytes_used_for_cache_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = ["CacheClusterId", ]
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.elasti_cache.replication_bytes_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = ["CacheClusterId", ]
      }

    }

  }

  chart {
    name = "Replication Lag"
    rank = "4"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.elasti_cache.replication_lag_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = ["CacheClusterId", ]
      }

    }

  }

  chart {
    name = "Database Memory Usage"
    rank = "5"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.elasti_cache.database_memory_usage_percentage_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "CPU Utilization"
    rank = "6"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.elasti_cache.cpu_utilization_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = ["CacheClusterId", ]
      }

    }

  }

  chart {
    name = "Network"
    rank = "7"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.elasti_cache.network_bytes_in_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = ["CacheClusterId", ]
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.elasti_cache.network_bytes_out_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = ["CacheClusterId", ]
      }

    }

  }

}