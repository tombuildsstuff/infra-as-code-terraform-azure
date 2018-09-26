locals {
  download_url = "https://github.com/tombuildsstuff/legacy-mvc-net471/releases/download/v${var.version}/legacy-mvc-net-471.zip"
}

resource "azurerm_app_service_plan" "main" {
  name                = "${var.prefix}-asp"
  location            = "${azurerm_resource_group.main.location}"
  resource_group_name = "${azurerm_resource_group.main.name}"

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "main" {
  name                = "${var.prefix}-appservice"
  location            = "${azurerm_resource_group.main.location}"
  resource_group_name = "${azurerm_resource_group.main.name}"
  app_service_plan_id = "${azurerm_app_service_plan.main.id}"

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "None"
  }

  app_settings {
    "Message"              = "Hello from Terraform"
    "WEBSITE_RUN_FROM_ZIP" = "${local.download_url}"
  }
}

output "website" {
  value = "https://${azurerm_app_service.main.default_site_hostname}"
}
