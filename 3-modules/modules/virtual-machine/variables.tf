locals {
  virtual_machine_name = "${var.prefix}-vm"
}

variable "admin_username" {
  description = "The username for the local administrator on this Virtual Machine"
}

variable "resource_group_name" {
  description = "The name of the resource group in which the Virtual Machine should exist"
}

variable "location" {
  description = "The Azure Region in which the Virtual Machine should exist"
}

variable "prefix" {
  description = "The prefix used for all resources used in the Virtual Machine"
}

variable "subnet_id" {
  description = "The ID of the Subnet in which this Virtual Machine should exist"
}

variable "tags" {
  type    = "map"
  default = {}
}
