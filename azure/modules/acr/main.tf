# Create a container registry
resource "azurerm_container_registry" "acr" {
  name                = "${var.prefix}acr"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  sku                 = var.acr_sku
  admin_enabled       = false
}

resource "azurerm_role_assignment" "aks_to_acr_assignment" {
  principal_id                     = var.principal_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}