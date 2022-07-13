variable "name-nsp" {
    type = string
    description = "Namespace event hub namespace"
}

variable "name-eh" {
    type = string
    description = "Name event hub entity"
}

variable "resource_group_name" {
    type = string
    description = "Name of the resource group"
}

variable "location" {
    type = string
    description = "The location for the deployment"
}