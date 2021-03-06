variable "project_id" {
  description = "The project ID to host the cluster in"
}

variable "environment" {
}

variable "cluster_name" {
  description = "The name of the cluster"
}

variable "db_count" {
  description = "Determines whether secrets are created"
}

variable "region" {
  description = "The region to host the cluster in"
}