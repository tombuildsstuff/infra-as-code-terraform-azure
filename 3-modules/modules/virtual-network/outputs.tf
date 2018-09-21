output "backend_subnet_id" {
  value = "${azurerm_subnet.backend.id}"
}

output "database_subnet_id" {
  value = "${azurerm_subnet.database.id}"
}

output "frontend_subnet_id" {
  value = "${azurerm_subnet.frontend.id}"
}
