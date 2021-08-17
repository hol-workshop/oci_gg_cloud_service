resource oci_golden_gate_database_registration TargetDB {
  alias_name    = var.alias_name
  compartment_id= var.compartment_id
  database_id 	= var.database_id
  display_name 	= var.display_name
  fqdn         	= var.fqdn
  password 		= var.password
  username 		= var.username
}