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
variable "principal_id" {
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
}
