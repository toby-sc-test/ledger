resource "google_sql_database_instance" "ledger" {
  database_version    = "POSTGRES_14"
  region              = "europe-west2"
  deletion_protection = true
  settings {
    availability_type = "REGIONAL"
    backup_configuration {
      enabled = true
    }
  }
}

resource "google_container_cluster" "ledger" {
  location           = "europe-west2"
  node_locations     = ["europe-west2-a", "europe-west2-b"]
  min_master_version = "1.29"
}

resource "azurerm_postgresql_flexible_server" "reports" {
  location              = "uksouth"
  version               = "12"
  backup_retention_days = 7
  high_availability {
    mode = "SameZone"
  }
}

resource "azurerm_storage_account" "ledger" {
  location        = "uksouth"
  min_tls_version = "TLS1_0"
}
