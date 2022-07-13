output "eventhub_nsp_out" {
  value = resource.azurerm_eventhub_namespace.eh-ns-streamming.name
}