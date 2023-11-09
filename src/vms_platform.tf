
variable "vm_db_name" { #main.tf 16
  type        = string
  default     = "netology-develop-platform-db"
  description = "имя машины"
}

variable "vm_db_platform_id" { #main.tf 17
  type        = string
  default     = "standard-v2"
  description = "политика планирования"
}

variable "vm_db_cores" { #main.tf 19
  type        = string
  default     = "2"
  description = "кол.во ядер"
}

variable "vm_db_memory" { #main.tf 20
  type        = string
  default     = "2"
  description = "размер оперативной памяти"
}

variable "vm_db_core_fraction" { #main.tf 21
  type        = string
  default     = "20"
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