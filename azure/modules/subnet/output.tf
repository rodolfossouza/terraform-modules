output "subnet_internal_id" {
  value = azurerm_subnet.rodnet-aks-subnet-internal.id
}
output "subnet_public_id" {
  value = azurerm_subnet.rodnet-aks-subnet-public.id
}