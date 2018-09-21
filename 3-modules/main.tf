provider "azurerm" {
  version = "=1.14.0"
}

locals {
  admin_username = "${var.prefix}user"
}

resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}-resources"
  location = "Australia East"
  tags     = "${var.tags}"
}

module "virtual-network" {
  source              = "./modules/virtual-network"
  resource_group_name = "${azurerm_resource_group.main.name}"
  location            = "${azurerm_resource_group.main.location}"
  prefix              = "${var.prefix}"
  tags                = "${var.tags}"
}

module "virtual-machine" {
  source              = "./modules/virtual-machine"
  admin_username      = "${local.admin_username}"
  resource_group_name = "${azurerm_resource_group.main.name}"
  location            = "${azurerm_resource_group.main.location}"
  prefix              = "${var.prefix}"
  subnet_id           = "${module.virtual-network.backend_subnet_id}"
  tags                = "${var.tags}"
}

output "admin_username" {
  value = "${local.admin_username}"
}

output "public_ip" {
  value = "${module.virtual-machine.public_ip_address}"
}
