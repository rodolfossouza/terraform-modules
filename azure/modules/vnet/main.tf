resource "azurerm_virtual_network" "rodnet-aks-vnet" {
  name                = "${var.prefix}-vnet"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  address_space       = ["${var.virtual_network_address_prefix}"]
  #dns_servers         = ["10.0.0.4", "10.0.0.5"]
  subnet = []
}
