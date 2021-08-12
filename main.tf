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
	ssh_public_key			= file("~/.ssh/id_rsa.pub")
	boot_size_in_gbs      	= var.source_db_boot_size_in_gbs
	display_name          	= var.source_db_display_name
	hostname_label        	= var.source_db_hostname_label
	compute_shape         	= var.source_db_compute_shape
	image_id              	= module.source_db_image.image_id
	subnet_id             	= oci_core_subnet.holvcn_public_subnet.id
	assign_public_ip      	= var.source_db_assign_public_ip
}

output "Source_DB_Public_IP" {
  value = module.source_db_compute.Source_DB_Public_IP
}

output "ATP_generated_password" {
  value = module.atp.ATP_generated_password
}
