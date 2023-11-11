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
  name        = local.vm_name_1 
  platform_id = var.vm_web_platform_id  #var.tf 55
  resources {
    cores         = var.vms_resources.vm_web_cores
    memory        = var.vms_resources.vm_web_memory
    core_fraction = var.vms_resources.vm_web_core_fraction
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
    serial-port-enable = var.metadata.serial-port-enable
    ssh-keys           = var.metadata.ssh_key
  }
  }

data "yandex_compute_image" "ubuntu2" {  #Можно ли как-нибудь сделать переменную для ubuntu2?
  family = var.vm_web_family  
}
resource "yandex_compute_instance" "platform2" {
  name        = local.vm_name_2
  platform_id = var.vm_db_platform_id  
  resources {
    cores         = var.vms_resources.vm_db_cores
    memory        = var.vms_resources.vm_db_memory
    core_fraction = var.vms_resources.vm_db_core_fraction
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
    serial-port-enable = var.metadata.serial-port-enable
    ssh-keys           = var.metadata.ssh_key
  }
  }




