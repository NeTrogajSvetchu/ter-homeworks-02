###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMb/Tl4p0U7I/ODT71YwLtyphuDmPqt6sLjgR6napPHn" 
  description = "ssh-keygen -t ed25519"
}

variable "vm_web_family" {  #main.tf 13 25
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Семейство операционки"
}

variable "vm_web_name" { #main.tf 16
  type        = string
  default     = "netology-develop-platform-web"
  description = "имя машины"
}

variable "vm_web_platform_id" { #main.tf 17
  type        = string
  default     = "standard-v2"
  description = "политика планирования"
}

variable "vm_web_cores" { #main.tf 19
  type        = string
  default     = "2"
  description = "кол.во ядер"
}

variable "vm_web_memory" { #main.tf 20
  type        = string
  default     = "1"
  description = "размер оперативной памяти"
}

variable "vm_web_core_fraction" { #main.tf 21
  type        = string
  default     = "5"
  description = "уровень производительности CPU"
}
variable "vm_web_ubuntu" { #main.tf 21
  type        = string
  default     = "ubuntu"
  description = "уровень производительности CPU"
}

variable "vm_web_platform" { #main.tf 21
  type        = string
  default     = "platform"
  description = "уровень производительности CPU"
}

/*variable "username" {
  description = "administrator username"
  type        = string
  sensitive   = true
}

variable "password" {
  description = "administrator password"
  type        = string
  sensitive   = true
}
*/