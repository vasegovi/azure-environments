resource "azurerm_storage_account" "storagesynapse" {
  name                     = var.namestoragesynapse
  resource_group_name      =  var.resource_group_name
  location                 = var.location
  account_tier             = var.storageacctier
  account_replication_type = var.storageaccreplicationtype
  account_kind             = var.storageacckind
  is_hns_enabled           = "true"
}

data "azurerm_subscription" "primary" {
}

data "azurerm_client_config" "synapseconf" {
}

resource "azurerm_role_assignment" "roleOwner" {
  scope                = azurerm_storage_account.storagesynapse.id
  role_definition_name = "Owner"
  principal_id         = data.azurerm_client_config.synapseconf.object_id
  timeouts {
    create = "1m"
    delete = "1m"
  }
}

resource "azurerm_storage_data_lake_gen2_filesystem" "synapsefsys" {
  name               = var.filesystemname
  storage_account_id = azurerm_storage_account.storagesynapse.id
  depends_on = [
    azurerm_role_assignment.roleOwner
  ]
}

resource "azurerm_synapse_workspace" "synapsewsp" {
  name                                 = var.namesynapse
  resource_group_name                  = var.resource_group_name
  location                             = var.location
  storage_data_lake_gen2_filesystem_id = azurerm_storage_data_lake_gen2_filesystem.synapsefsys.id
  sql_administrator_login              = var.sqladminuser
  sql_administrator_login_password     = var.sqladminpassword

  aad_admin {
    login     = "AzureAD Admin"
    object_id = var.addadminobjectid
    tenant_id = var.addadmintenantid
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_synapse_sql_pool" "sqlpoolsynapse" {
  name                 = var.sqlpoolsynapsename
  synapse_workspace_id = azurerm_synapse_workspace.synapsewsp.id
  sku_name             = var.sku_name
  create_mode          = "Default"
}

resource "azurerm_synapse_spark_pool" "sparkpoolsynapse" {
  name                 = var.sparkpoolsynapsename
  synapse_workspace_id = azurerm_synapse_workspace.synapsewsp.id
  node_size_family     = var.nodesizefamily
  node_size            = var.nodesize
  cache_size           = 100

  auto_scale {
    max_node_count = var.maxnodecount
    min_node_count = var.minnodecount
  }

   auto_pause {
    delay_in_minutes = 15
  }
}