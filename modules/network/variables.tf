variable "environment" {
    type = string
}

variable "resource_group_name" {
    type = string
}

variable "resource_group_location" {
    type = string
}

variable "address_space" {
  type = tuple([ string ])
  default = ["10.0.0.0/16"]
}