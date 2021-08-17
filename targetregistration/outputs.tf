output "deployment_name" {
  value = substr(oci_golden_gate_database_registration.TargetDB.id,6,18)
}