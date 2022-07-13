terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.7.0"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}

module "ResourceGroup" {
  source = "../modules/resource-group"
  nameRG = var.nameRG
  location = var.location
}


module "StorageAccount" {
  source = "../modules/storage"
  nameStorage = "streamdatalake"
  resource_group_name = module.ResourceGroup.rg_name_out
  location = var.location
}

module "EventHub" {
  source = "../modules/eventhub"
  name-nsp = "streaming-eh"
  name-eh = "customer"
  resource_group_name = module.ResourceGroup.rg_name_out
  location = var.location
}

module "Synapse" {
  source = "../modules/synapse"
  namesynapse = var.namesynapse
  resource_group_name = module.ResourceGroup.rg_name_out
  location = var.location
  namestoragesynapse = var.namestoragesynapse
  storageacctier= var.storageacctier
  storageaccreplicationtype = var.storageaccreplicationtype
  storageacckind = var.storageacckind
  filesystemname = var.filesystemname
  sqladminuser = var.sqladminuser
  sqladminpassword = var.sqladminpassword
  addadminobjectid = var.addadminobjectid
  addadmintenantid = var.addadmintenantid
  sqlpoolsynapsename = var.sqlpoolsynapsename
  sku_name = var.sku_name
  sparkpoolsynapsename = var.sparkpoolsynapsename
  nodesizefamily = var.nodesizefamily
  nodesize = var.nodesize
  maxnodecount = var.maxnodecount
  minnodecount = var.minnodecount
  loginadsynapse = var.loginadsynapse
}


module "KeyVault" {
  source = "../modules/keyvault"
  resource_group_name = module.ResourceGroup.rg_name_out
  location = var.location
  keyvaultname = var.keyvaultname
}

