terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }

  backend "remote" {
    organization = "siyasta-dev"

    workspaces {
      name = "terraform-demo"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "${var.environment}-rg"
  location = var.location
}

module "network" {
  source = "./modules/network"

  environment             = var.environment
  resource_group_location = azurerm_resource_group.example.location
  resource_group_name     = azurerm_resource_group.example.name
}

module "subnet" {
  source = "./modules/subnet"

  environment          = var.environment
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = module.network.virtual_network_name
}

module "vm" {
  source = "./modules/virtual-machine"

  environment             = var.environment
  resource_group_location = azurerm_resource_group.example.location
  resource_group_name     = azurerm_resource_group.example.name
  subnet_id               = module.subnet.subnet_id
  vm_count                = var.vm_count
}