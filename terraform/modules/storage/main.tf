terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

resource "azurerm_storage_account" "stg-data" {
  name                     = var.nameStorage
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

resource "azurerm_storage_container" "container1" {
  name                  = "eventhub"
  storage_account_name  = azurerm_storage_account.stg-data.name
  container_access_type = "private"
}