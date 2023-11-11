locals {
  vm_name_1 = "netology-${var.env}-${var.prod}-${var.role[0]}"
  vm_name_2 = "netology-${var.env}-${var.prod}-${var.role[1]}"
}

/*locals {
  vm_web_resources = "resources {cores =${var.vms_resources.vm_web_cores}; memory=${var.vms_resources.vm_web_memory}; core_fraction=${var.vms_resources.vm_web_core_fraction}}"
  vm_db_resources = "cores =${var.vms_resources.vm_db_cores} memory=${var.vms_resources.vm_db_memory}core_fraction=${var.vms_resources.vm_db_core_fraction}"
   
}
*/
