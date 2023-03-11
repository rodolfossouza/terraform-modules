# Create a Resource Group for Resources
resource "azurerm_resource_group" "rodnet-aks-rg" {
  name     = "${var.prefix}-rg"
  location = var.resource_group_location
}