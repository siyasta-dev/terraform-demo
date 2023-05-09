variable "environment" {
    type = string
}

variable "resource_group_name" {
    type = string
}

variable "virtual_network_name" {
    type = string
}

variable "address_prefixes" {
  type = tuple([ string ])
  default = ["10.0.2.0/24"]
}