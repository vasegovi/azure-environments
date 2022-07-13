variable "resource_group_name" {
    type = string
    description = "Name of the resource group"
}

variable "location" {
    type = string
    description = "The location for the deployment"
}

variable "appinsMLname" {
    type = string
    description = "name of app insight for ML"
}

variable "kvMLname" {
    type = string
    description = "name of keyvault for ML"
}

variable "staMLname" {
    type = string
    description = "name of storage for ML"
}

variable "MLwsname" {
    type = string
    description = "name of ML workspace for ML"
}



