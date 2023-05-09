variable "environment" {
  type = string
}

variable "location" {
  type    = string
  default = "West Europe"
}

variable "vm_count" {
  type    = number
  default = 2
}