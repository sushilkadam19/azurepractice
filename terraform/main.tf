
resource "azurerm_resource_group" "RG011" {
    count = 1
    name = "RG-CIGH-${count.index}"
    location = "Central India"
}

