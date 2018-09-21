provider "azurerm" {
  version = "=1.15.0"
}

# This assumes a Virtual Network named `ndc-shared-network` exists in the Resource Group `ndc-nw-resources`.
data "azurerm_virtual_network" "development" {
  name                = "ndc-shared-network"
  resource_group_name = "ndc-nw-resources"
}

resource "azurerm_subnet" "my" {
  name                 = "my-subnet"
  resource_group_name  = "${data.azurerm_virtual_network.development.resource_group_name}"
  virtual_network_name = "${data.azurerm_virtual_network.development.name}"
  address_prefix       = "172.0.3.0/24"
}
