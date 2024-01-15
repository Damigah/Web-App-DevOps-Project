# networking-module/outputs.tf

output "vnet_id" {
  description = "Variable that will store the ID of the previously created VNet. This will be used within the cluster module to connect the cluster to the defined VNet."
  value       = azurerm_virtual_network.aks_vnet.id
}

output "control_plane_subnet_id" {
  description = "Variable that will hold the ID of the control plane subnet within the VNet. This will be used to specify the subnet where the control plane components of the AKS cluster will be deployed to."
  value       = azurerm_subnet.control_plane_subnet.id
}

output "worker_node_subnet_id" {
  description = "Variable that will store the ID of the worker node subnet within the VNet. This will be used to specify the subnet where the worker nodes of the AKS cluster will be deployed to."
  value       = azurerm_subnet.worker_node_subnet.id
}

output "network_resource_group_name" {
  description = "Variable that will provide the name of the Azure Resource Group where the networking resources were provisioned in. This will be used to ensure the cluster module resources are provisioned within the same resource group."
  value       = azurerm_resource_group.networking.name
}

output "aks_nsg_id" {
  description = " Variable that will store the ID of the Network Security Group (NSG). This will be used to associate the NSG with the AKS cluster for security rule enforcement and traffic filtering."
  value       = azurerm_network_security_group.aks_nsg.id
}