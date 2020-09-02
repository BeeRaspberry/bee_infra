resource "random_id" "db_name_suffix" {
  byte_length = 4
}

resource "google_sql_database_instance" "master" {
  count            = var.db_machine_type == "" ? 0 : 1
  name             = "${var.cluster_name}-${var.environment}-${random_id.db_name_suffix.hex}-db-instance"
  database_version = var.db_version
  region           = var.region

  settings {
    tier = var.db_machine_type
    location_preference{
      zone = var.zone
    }
    ip_configuration {
      ipv4_enabled        = false
      private_network     = var.network
#      reguire_ssl         = true
#      authorized_networks = [
#        {
#          name  = "k8s_pods"
#          value = var.authorized_network
#        }
#      ]
    }
  }
}

resource "google_sql_user" "api_user" {
  count    = var.db_machine_type == "" ? 0 : 1
  name     = "api"
  instance = google_sql_database_instance.master[count.index].name
  password = var.api_password
}