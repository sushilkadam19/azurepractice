AKS_ACR = { 
  default ={
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


variable "resourcegroup" {
    type = string
    default = "rg01"
}


variable "rglocation" {
    type = string
    location = "Central India"
}

