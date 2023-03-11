variable "subnets_prefix" {
    type = map(string)
    description = "(optional) describe your variable"
    default = {
      "" = ""
    }
}

variable "virtual_network_name" {
  type = string
  description = "(optional) describe your variable"
  default = ""
}

variable "resource_group_location" {
  type = string
  description = "(optional) describe your variable"
  default = ""
}

variable "resource_group_name" {
  type = string
  description = "(optional) describe your variable"
  default = ""
}