resource "azurerm_virtual_network" "main" {
  name                = "${var.environment}-network"
  address_space       = var.address_space
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}