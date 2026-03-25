variable "acr_name" { 
  description = "the name of the resource group in wich to create the container registry"
  type        = string
}
 variable "location" {
    description = "the location of the resource group in wich to create the container registry"
    type        = string
 }
    variable "resource_group_name" {
        description = "the name of the resource group in wich to create the container registry"
        type        = string
    }
    variable "sku" {
        description = "the SKU of the container registry (Basic, Standard, Premium)"
        type        = string
    }
    variable "admin_enabled" {
        description = "whether to enable the admin user for the container registry"
        type        = bool
    }
    variable "tags" {
        description = "the tags to apply to the container registry"
        type        = map(string)
        default     = {}
    }
#    variable "acr_username" {
#        description = "the username for the container registry"
#        type        = string
