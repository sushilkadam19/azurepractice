
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
      type = each.value["identity"]
    }
    tags = each.value["tags"]
  
}


resource "azurerm_role_assignment" "aksras" {
  for_each = var.AKS_ACR
  //principal_id                     = azurerm_kubernetes_cluster.aks01.kubelet_identity[each.AKS01].object_id
  principal_id                     = azurerm_kubernetes_cluster.aks01[each.key].identity[0].principal_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr01practice01[each.key].id
  skip_service_principal_aad_check = true
}

output "aks_principal_ids" {
  //value = { for key, value in azurerm_kubernetes_cluster.aks01 : key => value.identity[0].principal_id }
  value = azurerm_role_assignment.aksras[each.key]
}



