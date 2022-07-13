provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

resource "azurerm_application_insights" "appinsML" {
  name                = var.appinsMLname
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = "web"
}

resource "azurerm_key_vault" "kvML" {
  name                = var.kvMLname
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "premium"
}

resource "azurerm_storage_account" "staML" {
  name                     = var.staMLname
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_machine_learning_workspace" "MLws" {
  name                    = var.MLwsname
  location                = var.location
  resource_group_name     = var.resource_group_name
  application_insights_id = azurerm_application_insights.appinsML.id
  key_vault_id            = azurerm_key_vault.kvML.id
  storage_account_id      = azurerm_storage_account.staML.id

  identity {
    type = "SystemAssigned"
  }
}