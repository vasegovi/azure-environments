resource "azurerm_resource_group" "rg-create" {
  name     = var.nameRG
  location = var.location
}