resource "azurerm_resource_group" "rg" {
  name     = "tm-rg"
  location = "UK South"
}

module "acr" {
  source = "./modules/acr"

  acr_name            = "tmacr"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"
  admin_enabled       = true
}
# resource "azurerm_container_app_environment" "env" {
#   name                = "tm-env"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
# }