terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  client_id       = "" # Enter your Client ID
  client_secret   = "" # Enter your password for your client ID
  subscription_id = "" # Enter your subscription ID
  tenant_id       = "" # Enter your tenent ID
}

module "networking" {
  source = "./networking-module"

  # Input variables for the networking module
  resource_group_name = "networking-rg" # Creating the resource group name
  location           = "UK South" # Location of the Cluster
  vnet_address_space = ["10.0.0.0/16"] # The address space specifies the range of IP addresses that can be used within the virtual network.

}

module "aks_cluster" {
  source = "./aks-cluster-module"

  # Input variables for the AKS cluster module
  aks_cluster_name           = "terraform-aks-cluster"
  cluster_location           = "UK South"
  dns_prefix                 = "myaks-project"
  kubernetes_version         = "1.26.6"  # Adjust the version as needed
  service_principal_client_id = "" # Enter your Client ID
  service_principal_client_secret = "" # Enter your password for your client ID

  # Input variables referencing outputs from the networking module
  resource_group_name         = module.networking.network_resource_group_name
  vnet_id                     = module.networking.vnet_id
  control_plane_subnet_id     = module.networking.control_plane_subnet_id
  worker_node_subnet_id       = module.networking.worker_node_subnet_id
  aks_nsg_id                  = module.networking.aks_nsg_id

}