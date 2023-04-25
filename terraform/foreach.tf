variable "resourcegroup" {
    type = string
    default = "rg01"
}


variable "rglocation" {
    type = string
    name = "Central India"
}

resource "azurerm_resource_group" "RG01" {
    name = var.resourcegroup
    location = var.rglocation
}
