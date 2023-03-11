variable "prefix" {
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

variable "resource_group_name" {
  type = string
  description = "(optional) describe your variable"
  default = ""
}

variable "resource_group_location" {
  type = string
  description = "(optional) describe your variable"
  default = ""
}