variable "resource_group_name" {
    type = string
    description = "Name of the resource group"
}

variable "location" {
    type = string
    description = "The location for the deployment"
}

variable "keyvaultname" {
    type = string
    description = "Azure Key Vault name"
}