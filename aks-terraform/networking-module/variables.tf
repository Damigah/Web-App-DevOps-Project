variable "resource_group_name" {
    description = "Name of the resource group"
    type = string
    default = "aks-rg"
    
}

variable "location" {
    description = "Location on where it will be deployed"
    type = string
    default = "UK South"
    
}

variable "vnet_address_space" {
    description = "Address space for Virtual Network (VNet)"
    type = list(string)
    default = ["10.0.0.0/16"]
    
}
