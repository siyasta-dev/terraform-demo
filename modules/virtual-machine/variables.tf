variable "environment" {
    type = string
}

variable "resource_group_name" {
    type = string
}

variable "resource_group_location" {
    type = string
}

variable "subnet_id" {
    type = string
}

variable "vm_count" {
    type = number
    default = 1
}

variable "vm_size" {
  type = string
  default = "Standard_DS1_v2"
}