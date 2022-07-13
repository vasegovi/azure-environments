variable "nameRG" {
    type = string
    description = "The base of the name for the resource group and storage account"
}

variable "location" {
    type = string
    description = "The location for the deployment"
}

variable "namesynapse" {
    type = string
    description = "Name of synapse"
}

variable "namestoragesynapse" {
    type = string
    description = "name storage account"
}

variable "storageacctier" {
    type = string
    description = "account_tier"
}

variable "storageaccreplicationtype" {
    type = string
    description = "name account_replication_type account"
}

variable "storageacckind" {
    type = string
    description = "account_kind"
}

variable "filesystemname" {
    type = string
    description = "file system name"
}

variable "sqladminuser" {
    type = string
    description = "sql_administrator_login"
}

variable "sqladminpassword" {
    type = string
    description = "sql_administrator_login_password"
}

variable "addadminobjectid" {
    type = string
    description = "aad_admin - objectid"
}

variable "addadmintenantid" {
    type = string
    description = "aad_admin - tenantid"
}

variable "sqlpoolsynapsename"{
    type= string
    description = "name of sql pool synapse"
}

variable "sku_name"{
    type= string
    description = "sku of name of sql pool synapse"
}

variable "sparkpoolsynapsename"{
    type= string
    description = "name os spark pool "
}

variable "nodesizefamily"{
    type= string
    description = "node_size_family"
}

variable "nodesize"{
    type= string
    description = "node_size"
}

variable "maxnodecount"{
    type= number
    description = "max_node_count"
}

variable "minnodecount"{
    type= number
    description = "min_node_count"
}

variable "loginadsynapse"{
    type= string
    description = "Login AAD Synapse"
}

variable "keyvaultname" {
    type = string
    description = "Azure Key Vault name"
}