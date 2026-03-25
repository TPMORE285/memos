# resource "azurerm_container_app" "app" {
#   name                         = "memos-app"
#   resource_group_name          = azurerm_resource_group.rg.name
#   container_app_environment_id = azurerm_container_app_environment.env.id
#   revision_mode                = "Single"

#   ingress {
#     external_enabled = true
#     target_port      = 5230
#     traffic_weight {
#       percentage      = 100
#       latest_revision = true
#     }
#   }

#   template {
#     container {
#       name   = "memos"
#       image  = var.image_name
#       cpu    = 0.5
#       memory = "1Gi"
#     }
#   }

#   registry {
#     server               = "memosacr.azurecr.io"
#     username             = var.acr_username
#     password_secret_name = "acr-password"
#   }

#   secret {
#     name  = "acr-password"
#     value = var.acr_password
#   }
# }