resource "azurerm_eventhub_namespace" "eh-ns-streamming" {
  name                = var.name-nsp
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
  capacity            = 1
}

resource "azurerm_eventhub" "example" {
  name                = var.name-eh
  namespace_name      = azurerm_eventhub_namespace.eh-ns-streamming.name
  resource_group_name = var.resource_group_name
  partition_count     = 2
  message_retention   = 1
}