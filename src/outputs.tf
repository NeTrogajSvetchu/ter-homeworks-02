output "instance_ip_addr1" { 
  value = yandex_compute_instance.platform.network_interface[0].nat_ip_address
}
output "instance_ip_addr2" { 
  value = yandex_compute_instance.platform2.network_interface[0].nat_ip_address
}

