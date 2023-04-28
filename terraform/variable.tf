variable "AKS_ACR" {
  type = map(object({
    aks_name       = string
    aks_node_count = number
    aks_dns_prefix = string
    aks_vm_size    = string
    identity       = string
    tags           = map(string)
    acr_name       = string
    acr_sku        = string
  }
  ))
  default = {
    "one" = {
    aks_name        =  "AKS01"
    aks_node_count = 1
    aks_dns_prefix = "AKS01"
    aks_vm_size    = "Standard_D2_v2"
    identity       = "SystemAssigned"
    tags           = {
      "Dept" = "IT"
      "Env"  = "Dev"
    }
    acr_name       = "acr01practice01"
    acr_sku        = "Premium"
    }
   "two" = {
    aks_name        =  "AKS02"
    aks_node_count = 1
    aks_dns_prefix = "AKS02"
    aks_vm_size    = "Standard_D2_v2"
    identity       = "SystemAssigned"
    tags           = {
      "Dept" = "IT"
      "Env"  = "Dev"
    }
    acr_name       = "acr02practice02"
    acr_sku        = "Premium"
    }
  }
}





/*
variable "acr" {
    description = "Azure Container Registery"
    type = string
    default = "acr01practice01"
  
}

variable "acrsku" {
    description = "Azure Container Registery"
    type = string
    default = "Premium"
  
}

variable "aks_name_dns_prefix" {
    description = "Azure Container Registery"
    type = string
    default = "aks01"
  
}

variable "default_node_pool_count" {
  description = "default_node_pool_count"
   type = number
   default = 1
}

variable "default_node_pool_vm_size" {
  description = "default_node_pool_vm_size"
   type = string
   default = "Standard_D2_v2"
}

variable "aks_identity" {
    description = "AKS identity"
    type = string
    default = "SystemAssigned"
  
}

variable "environment" {
  type = string
  default = "production"
}
 */