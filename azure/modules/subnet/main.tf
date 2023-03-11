resource "azurerm_subnet" "rodnet-aks-subnet-internal" {
  name                 = "internal"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = [var.subnets_prefix["internal"]]
}

resource "azurerm_subnet" "rodnet-aks-subnet-public" {
  name                 = "public"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = [var.subnets_prefix["public"]]
}