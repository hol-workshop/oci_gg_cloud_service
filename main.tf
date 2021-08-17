module "atp" {
	source          = "./atp"
	compartment_id  = var.compartment_ocid
	display_name 	= var.atp_display_name
	db_name         = "hol${random_string.deploy_id.result}"
	db_workload  	= var.atp_workload
	is_free_tier	= var.atp_is_free_tier
	db_version 	= var.atp_db_version
	cpu_core_count	= var.atp_ocpu_count
	data_storage_size_in_tbs 	= var.atp_storage_size
	license_model	= var.atp_license_model
	generate_type	= var.atp_wallet_generate_type
}

output "ATP_generated_password" {
  value = module.atp.ATP_generated_password
}

module "source_db_image" {
	source            = "./source_image"
	compartment_id  = var.image_compartment_id
	market_image_id   = local.mp_listing_resource_id
	custom_image_name = "${var.source_dbms}_${var.source_dbms_version}"
}
module "source_db_compute" {
	source                	= "./source_db"
	compartment_id      	= var.compartment_ocid
	availability_domain   	= data.oci_identity_availability_domains.ads.availability_domains[0].name
	ssh_public_key			= file("~/.ssh/oci.pub")
	boot_size_in_gbs      	= var.source_db_boot_size_in_gbs
	display_name          	= var.source_db_display_name
	hostname_label        	= var.source_db_hostname_label
	compute_shape         	= var.source_db_compute_shape
	image_id              	= module.source_db_image.image_id
	subnet_id             	= oci_core_subnet.holvcn_public_subnet.id
	assign_public_ip      	= var.source_db_assign_public_ip
}

module "goldengate_deployment" {
	source		= "./goldengate"
	compartment_id 	= var.compartment_ocid
	core_count		= var.deployment_cpu_core_count
	deployment_type = var.deployment_deployment_type
	display_name    = var.deployment_display_name
	auto_scaling	= var.deployment_is_auto_scaling_enabled
	license_model	= var.deployment_license_model
	subnet_id	= oci_core_subnet.holvcn_public_subnet.id
	is_public 	= var.deployment_is_public
	admin_password  = var.deployment_ogg_data_admin_password
    admin_username  = var.deployment_ogg_data_admin_username
    deployment_name = module.target_registration.deployment_name
}

module "target_registration" {
	source 		= "./targetregistration"
	alias_name     	= var.target_alias_name
	compartment_id 	= var.compartment_ocid
	database_id 	= module.atp.database_id
	display_name 	= var.target_display_name
	fqdn         	= "adb.${var.region}.oraclecloud.com"
	password 		= var.target_password
	username 		= var.target_username
}

module "source_registration" {
	source 		= "./sourceregistration"
	alias_name     	= var.source_alias_name
	compartment_id 	= var.compartment_ocid
	connection_string = "${module.source_db_compute.Source_DB_Public_IP}:1521/ORCL"
	display_name 	= var.source_display_name
	fqdn        = "${var.source_db_hostname_label}.${var.holvcn_public_dns_label}.${var.holvcn_dns_label}.oraclevcn.com"
	password 	= var.source_password
	username 	= var.source_username
}
output "Source_DB_Public_IP" {
  value = module.source_db_compute.Source_DB_Public_IP
}