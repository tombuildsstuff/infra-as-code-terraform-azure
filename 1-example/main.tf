provider "azurerm" {
  version = "=1.15.0"
}

resource "azurerm_resource_group" "example" {
  name     = "ndc-sydney"
  location = "australia east"
}

resource "azurerm_virtual_network" "example" {
  name                = "tom-example-network"
  resource_group_name = "${azurerm_resource_group.example.name}"
  location            = "${azurerm_resource_group.example.location}"
  address_space       = ["10.0.0.0/16"]
}
