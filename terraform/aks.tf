/*
data "azurerm_resource_group" "RG" {
  name = "RG-CIGH-0"
  #location ="Central India"
}

resource "azurerm_container_registry" "acr01practice01" {
    name = var.acr
    resource_group_name = data.azurerm_resource_group.RG.name
    location = data.azurerm_resource_group.RG.location
    sku = var.acrsku

}
resource "azurerm_kubernetes_cluster" "aks01" {
    name = var.aks_name_dns_prefix 
    location = data.azurerm_resource_group.RG.location
    resource_group_name = data.azurerm_resource_group.RG.name
    dns_prefix = var.aks_name_dns_prefix 

    default_node_pool {
      name = "default"
      node_count = var.default_node_pool_count
      vm_size =  var.default_node_pool_vm_size
    }
    identity {
      type = var.aks_identity
    }
    tags = {
    Environment = var.environment
  }
  
}
resource "azurerm_role_assignment" "aksras" {
  principal_id                     = azurerm_kubernetes_cluster.aks01.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr01practice01.id
  skip_service_principal_aad_check = true
}

*/