variable "aks_vm_size" {
  type = string
  description = "(optional) describe your variable"
  default = ""
}
variable "aks_node_count" {
  type = string
  description = "(optional) describe your variable"
  default = ""
}
variable "aks_dns_prefix" {
  type = string
  description = "(optional) describe your variable"
  default = ""
}
variable "acr_admin_enabled" {
  type = bool
  description = "(optional) describe your variable"
  default = false
}
variable "acr_sku" {
  type = string
  description = "(optional) describe your variable"
  default = ""
}

variable "prefix" {
  type = string
  description = "(optional) describe your variable"
  default = ""
}

variable "resource_group_location" {
  type = string
  description = "(optional) describe your variable"
  default = ""
}

variable "node_subnet_id" {
    type = string
    description = "(optional) describe your variable"
    default = ""
}
variable "aks_networking" {
    type = map(string)
    description = "(optional) describe your variable"
    default = {
      "service_cidr" = ""
      "dns_service_ip" = ""
      "docker_bridge_cidr" = ""

    }
}

variable "admin_username" {
    type = string
    description = "(optional) describe your variable"
    default = ""
}
variable "ssh_public_key" {
  type = string
  default = ""
}
variable "subscription_id" {
  type = string
  description = "(optional) describe your variable"
  default = ""
}
variable "tenant_id" {
  type = string
  description = "(optional) describe your variable"
  default = ""
}



# Variables for Virtual Network
variable "virtual_network_name" {
    type = string
    description = "(optional) describe your variable"
    default = ""
}

variable "virtual_network_address_prefix" {
    type = string
    description = "(optional) describe your variable"
    default = ""
}

variable "subnets_prefix" {
    type = map(string)
    description = "(optional) describe your variable"
    default = {
      "" = ""
    }
}


variable "resource_group_name" {
  type = string
  description = "(optional) describe your variable"
  default = ""
}

variable "subnet_internal_id" {
  type = string
  description = "(optional) describe your variable"
  default = ""
}
variable "subnet_public_id" {
  type = string
  description = "(optional) describe your variable"
  default = ""
}