resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-network"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "database" {
  name                 = "database"
  resource_group_name  = "${var.resource_group_name}"
  virtual_network_name = "${azurerm_virtual_network.main.name}"
  address_prefix       = "10.0.1.0/24"
}

resource "azurerm_subnet" "backend" {
  name                 = "backend"
  resource_group_name  = "${var.resource_group_name}"
  virtual_network_name = "${azurerm_virtual_network.main.name}"
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_subnet" "frontend" {
  name                 = "frontend"
  resource_group_name  = "${var.resource_group_name}"
  virtual_network_name = "${azurerm_virtual_network.main.name}"
  address_prefix       = "10.0.3.0/24"
}
