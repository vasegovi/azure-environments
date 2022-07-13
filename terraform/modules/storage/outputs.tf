output "stg_act_name_out" {
  value = resource.azurerm_storage_account.stg-data.name
}

output "stg_act_id_out" {
  value = resource.azurerm_storage_account.stg-data.id
}