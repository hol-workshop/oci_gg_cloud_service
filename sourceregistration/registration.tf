resource oci_golden_gate_database_registration SourceDB {
  alias_name    	= var.alias_name
  compartment_id	= var.compartment_id
  display_name 	= var.display_name
  connection_string = var.connection_string
  fqdn         	= var.fqdn
  password 		= var.password
  username 		= var.username
}
