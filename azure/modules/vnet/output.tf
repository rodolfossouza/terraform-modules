output "virtual_network_name" {
  value = azurerm_virtual_network.rodnet-aks-vnet.name
}
output "resource_group_name" {
  value = azurerm_virtual_network.rodnet-aks-vnet.resource_group_name
  
}