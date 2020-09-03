output "api_password" {
  description = "api user password"
  value       = random_string.db-api-pwd.result
}

output "root_password" {
  description = "root password"
  value       = random_string.db-root-pwd.result
}