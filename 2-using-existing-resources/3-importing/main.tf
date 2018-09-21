provider "azurerm" {
  version = "=1.15.0"
}

# /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/ndc-sydney-manual
resource "azurerm_resource_group" "example" {
  name     = "ndc-sydney-manual"
  location = "Australia East"
}
