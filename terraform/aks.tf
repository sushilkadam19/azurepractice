data "azurerm_resource_group" "RG" {
  name = "RG-CIGH-0"
  #location ="Central India"
}

resource "azurerm_container_registry" "acr01" {
    name = "acr01"
    resource_group_name = data.azurerm_resource_group.RG.name
    location = data.azurerm_resource_group.RG.location
    sku = "Premium"

}
resource "azurerm_kubernetes_cluster" "aks01" {
    name = "AKS01"
    location = data.azurerm_resource_group.RG.location
    resource_group_name = data.azurerm_resource_group.RG.resource_group_name
    dns_prefix = "aks01"

    default_node_pool {
      name = "default"
      node_count = 1
      vm_size =  "Standard_D2_v2"
    }
    identity {
      type = "SystemAssigned"
    }
    tags = {
    Environment = "Production"
  }
  
}
resource "azurerm_role_assignment" "aksras" {
  principal_id                     = azurerm_kubernetes_cluster.aks01.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr01.id
  skip_service_principal_aad_check = true
}
