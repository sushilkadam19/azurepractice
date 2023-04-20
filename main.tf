resource "azurerm_resource_group" "RG01" {
    count = 4
    name = "RG-CI-${count.index}"
    location = "Central India"
}