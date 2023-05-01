resource "azurerm_resource_group" "testrg-count" {
  count = length(var.testrg-count)
  name = var.testrg-count[count.index]
  location = "Central India"
}