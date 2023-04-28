
data "azurerm_resource_group" "RG" {
  name = "RG-CIGH-0"
  #location ="Central India"
}


resource "azurerm_container_registry" "acr01practice01" {
    for_each = var.AKS_ACR
    name = each.value["acr_name"]
    resource_group_name = data.azurerm_resource_group.RG.name
    location = data.azurerm_resource_group.RG.location
    sku = each.value["acr_sku"]

}
resource "azurerm_kubernetes_cluster" "aks01" {
    for_each = var.AKS_ACR
    name = each.value["aks_name"] 
    location = data.azurerm_resource_group.RG.location
    resource_group_name = data.azurerm_resource_group.RG.name
    dns_prefix = each.value["aks_dns_prefix"]

    default_node_pool {
      name = "default"
      node_count = each.value["aks_node_count"]
      vm_size =  each.value["aks_vm_size"]
    }
    identity {
      type = each.value["aks_identity"]
    }
    tags = {
    Environment = each.value["tags"]
  }
  
}

/*
resource "azurerm_role_assignment" "aksras" {
  principal_id                     = azurerm_kubernetes_cluster.aks01.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr01practice01.id
  skip_service_principal_aad_check = true
}

*/