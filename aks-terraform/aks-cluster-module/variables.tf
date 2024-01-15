# aks-cluster/variables.tf

variable "aks_cluster_name" {
    description = "The name of the AKS cluster."
    type = string
}

variable "cluster_location" {
    description = "The Azure region to be deployed to."
    type = string
}

variable "dns_prefix" {
    description = "The DNS prefix of cluster."
    type = string
}

variable "kubernetes_version" {
    description = "The kubernetes version the cluster will use."
    type = string
}

variable "service_principal_client_id" {
    description = "The Client ID for the service principal associated with the cluster."
    type = string
}

variable "service_principal_client_secret" {
    description = "Supplies the Client Secret for the service principal."
    type = string
}

# Input variables from the networking module
variable "resource_group_name" {
    description = "The name of the resource group."
    type = string
}

variable "vnet_id" {
    description = "The identity of the virtual network."
    type = string
}

variable "control_plane_subnet_id" {
    description = "The identity of the control plane."
    type = string
}

variable "worker_node_subnet_id" {
    description = "The identity of the worker node."
    type = string 
}

variable "aks_nsg_id" {
    description = "The Network Security Group ID."
    type = string
}