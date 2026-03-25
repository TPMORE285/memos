variable "image_name" {
  description = "Container image from ACR"
  type        = string
}

variable "acr_username" {
  description = "ACR admin username"
  type        = string
  sensitive   = true
}

variable "acr_password" {
  description = "ACR admin password"
  type        = string
  sensitive   = true
}