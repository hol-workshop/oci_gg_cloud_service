resource "oci_golden_gate_deployment" "hol_deployment" {
  #Required
  compartment_id          = var.compartment_id
  cpu_core_count          = var.core_count
  deployment_type         = var.deployment_type
  display_name            = var.display_name
  is_auto_scaling_enabled = var.auto_scaling
  license_model           = var.license_model
  subnet_id               = var.subnet_id

  #Optional
  #defined_tags         = map(oci_identity_tag_namespace.tag-namespace1.name.oci_identity_tag.tag1.name, var.deployment_defined_tags_value)
  #deployment_backup_id = oci_golden_gate_deployment_backup.test_deployment_backup.id
  #description          = var.deployment_description
  is_public            = var.is_public
  ogg_data {
    #Required
    admin_password  = var.admin_password
    admin_username  = var.admin_username
    deployment_name = var.deployment_name
  }
}