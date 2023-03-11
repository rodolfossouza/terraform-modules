# Variables for Resource Group
resource_group_location = "EASTUS2"
resource_group_name = "rodnet-aks-rg"

# Variables for Azure Virtual Networking
virtual_network_address_prefix = "192.0.0.0/8"
subnets_prefix = {
  "internal" = "192.192.0.0/21"
  "public" = "192.192.8.0/21"
}
# Variables for Log Analytics Workspace
log_analytics_workspace_sku = "PerGB2018"
loganalytics_workspace_name = "rodnet-lgws"


# Variables for AKS and ACR
aks_cluster_name = "rodnet-aks-cluster"
aks_networking = {
  "service_cidr" = "192.168.0.0/16"
  "dns_service_ip" = "192.168.16.10"
  "docker_bridge_cidr" = "172.17.0.1/16"
}
admin_username = "rodnetadmin"
aks_vm_size = "Standard_DS2_v2" # Tamanho da VM do NodePool
aks_node_count = "2" # Quantidade de NodePools
aks_dns_prefix = "rodnetaks" 
act_admin_enabled = "false" # trueo ou false
acr_sku = "Basic" # Basic, Standard ou Premium
acr_name = "rodnetacr" 
subscription_id = "3ff83fe0-bf97-4260-a00c-fe5bac9e8693" # ID da assinatura no Azure
tenant_id = "ba32ad54-972c-4c24-81ba-8a1828a7d90c"    # ID do Tenant da Assinatura
ssh_public_key = "./sshkey/rodnet-aks-learn" # Caminho da sua chave SSH
