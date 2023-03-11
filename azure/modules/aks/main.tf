terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.41.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
  required_version = ">=1.3.7"
}

provider "azurerm" {
    features {}
    subscription_id = var.subscription_id 
    tenant_id = var.tenant_id
  # Configuration options
}

# Create a Resource Group for Resources
resource "azurerm_resource_group" "rodnet-aks-rg" {
  name     = "${var.prefix}-rg"
  location = var.resource_group_location
}
# Create VNET
resource "azurerm_virtual_network" "rodnet-aks-vnet" {
  name                = "${var.prefix}-vnet"
  location            = azurerm_resource_group.rodnet-aks-rg.location
  resource_group_name = azurerm_resource_group.rodnet-aks-rg.name
  address_space       = ["${var.virtual_network_address_prefix}"]
  #dns_servers         = ["10.0.0.4", "10.0.0.5"]
  subnet = []
}
resource "azurerm_subnet" "rodnet-aks-subnet-internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.rodnet-aks-rg.name
  virtual_network_name = azurerm_virtual_network.rodnet-aks-vnet.name
  address_prefixes     = [var.subnets_prefix["internal"]]
}

resource "azurerm_subnet" "rodnet-aks-subnet-public" {
  name                 = "public"
  resource_group_name  = azurerm_resource_group.rodnet-aks-rg.name
  virtual_network_name = azurerm_virtual_network.rodnet-aks-vnet.name
  address_prefixes     = [var.subnets_prefix["public"]]
}

# Create a container registry
resource "azurerm_container_registry" "acr" {
  name                = "${var.prefix}acr"
  resource_group_name = azurerm_resource_group.rodnet-aks-rg.name
  location            = azurerm_resource_group.rodnet-aks-rg.location
  sku                 = var.acr_sku
  admin_enabled       = false
}

# Creates an AKS Cluster
resource "azurerm_kubernetes_cluster" "rodnet-aks" {
  name                = "${var.prefix}-akscluster"
  location            = azurerm_resource_group.rodnet-aks-rg.location
  resource_group_name = azurerm_resource_group.rodnet-aks-rg.name
  dns_prefix          = "${var.prefix}-k8s"

  default_node_pool {
    name       = "default"
    node_count = var.aks_node_count
    vm_size    = var.aks_vm_size
    vnet_subnet_id = azurerm_subnet.rodnet-aks-subnet-internal.id
  }

    linux_profile {
      admin_username = var.admin_username

      ssh_key {
        key_data = file(var.ssh_public_key)
      }
    }

  identity {
    type = "SystemAssigned"
  }
  network_profile {
    network_plugin = "azure"
    load_balancer_sku = "standard"
    ip_versions = ["IPv4"]
    outbound_type     = "loadBalancer"
    service_cidr = var.aks_networking["service_cidr"] 
    dns_service_ip = var.aks_networking["dns_service_ip"]
    docker_bridge_cidr= var.aks_networking["docker_bridge_cidr"]
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "rodnet-aks-front-prd-pool" {
  name                  = "frontprod"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.rodnet-aks.id
  vm_size               = var.aks_vm_size
  node_count            = var.aks_node_count
  vnet_subnet_id =  azurerm_subnet.rodnet-aks-subnet-public.id
  tags = {
    Environment = "Production"
  }

  node_labels = {
    Environment = "Prod"
    Layer = "front"

  }
}
resource "azurerm_kubernetes_cluster_node_pool" "rodnet-aks-back-prd-pool" {
  name                  = "backprod"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.rodnet-aks.id
  vm_size               = var.aks_vm_size
  node_count            = var.aks_node_count
  vnet_subnet_id = azurerm_subnet.rodnet-aks-subnet-internal.id

  tags = {
    Environment = "Production"
  }

  node_labels = {
    Environment = "Prod"
    Layer = "back"

  }
}

resource "azurerm_role_assignment" "aks_to_acr_assignment" {
  principal_id                     = azurerm_kubernetes_cluster.rodnet-aks.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}