output "ATP_generated_password" {
  value = random_string.atp_admin_password.result
}
output "wallet" {
  value = oci_database_autonomous_database_wallet.wallet.content
}
output "database_id" {
  value = oci_database_autonomous_database.target_atp.id
}
