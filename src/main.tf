resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family  # var.tf 43
}

resource "yandex_compute_instance" "platform" {
  name        = var.vm_web_name # var.tf 49
  platform_id = var.vm_web_platform_id  #var.tf 55
  resources {
    cores         = var.vm_web_cores #var.tf 61
    memory        = var.vm_web_memory #var.tf 67
    core_fraction = var.vm_web_core_fraction #var.tf 73
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
  }
  
data "yandex_compute_image" "ubuntu2" {  #Можно ли как нибудь сделать перепенную для ссылкиUbuntu?
  family = var.vm_web_family  
}
resource "yandex_compute_instance" "platform2" {
  name        = var.vm_db_name 
  platform_id = var.vm_db_platform_id  
  resources {
    cores         = var.vm_db_cores 
    memory        = var.vm_db_memory 
    core_fraction = var.vm_db_core_fraction 
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu2.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
  }

/*resource "yandex_compute_instance" "platform" {
  username          = var.username
  password          = var.password
  }
 */


