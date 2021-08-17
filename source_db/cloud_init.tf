data "template_file" "source_db_script" {
  template = file("source_db/source_db.sh")
  vars = {
	"config_file" 		= file("source_db/script.sql")
	"config_file2" 		= file("source_db/update.sql")
  }
}


data "template_cloudinit_config" "source_db_cloud_init" {
  gzip          = true
  base64_encode = true

  part {
    filename     = "cloud-init.sh"
    content_type = "text/x-shellscript"
    content      = data.template_file.source_db_script.rendered
  }
}
