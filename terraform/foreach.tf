resource "azurerm_resource_group" "RG01" {
    name = var.resourcegroup.default
    location = var.rglocation.location
}
