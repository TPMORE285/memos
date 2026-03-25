resource "azurerm_container_app_environment" "example" {
  name                       = var.container_app
  location                   = var.location
  resource_group_name        = var.resource_group_name
  log_analytics_workspace_id = var.log_analytics_workspace_id
}

resource "azurerm_container_app" "example" {
  name                         = var.container_app
  container_app_environment_id = var.container_app_environment_id
  resource_group_name          = var.resource_group_name
  revision_mode                = "Single"

  template {
    container {
      name   = var.container_app
      image  = var.image_name
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }
}