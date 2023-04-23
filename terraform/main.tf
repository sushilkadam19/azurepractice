resource "azurerm_resource_group" "RG01" {
    count = 3
    name = "RG-CIGH-${count.index}"
    location = "Central India"
}
