resource "azurerm_resource_group" "testrg-count" {
  count = length(var.testrg-count)
  name = var.testrg-count[count.index]
  location = "Central India"
}


resource "azurerm_network_security_group" "nsg01" {
    name = "nsg01"
    location = azurerm_resource_group.testrg-count[1].location
    resource_group_name = azurerm_resource_group.testrg-count[1].name

    security_rule = [
            /*{
                name                       = "test123"
                priority                   = 160
                direction                  = "Inbound"
                access                     = "Allow"
                protocol                   = "Tcp"
                source_port_range          = "*"
                destination_port_range     = "3330"
                source_address_prefix      = "*"
                destination_address_prefix = "*"
            }, */
            {
              access                                     = "Allow"
              destination_address_prefix                 = "*"
              destination_port_range                     = "3389"
              direction                                  = "Inbound"
              name                                       = "rdp"
              priority                                   = 150
              protocol                                   = "*"
              source_address_prefix                      = "*"
              source_port_range                          = "*"
             
            },
        ]

}

resource "azurerm_virtual_network" "vnet01" {
    name = "vnet01"
    location = azurerm_resource_group.testrg-count[1].location
    resource_group_name = azurerm_resource_group.testrg-count[1].name
    address_space = ["10.0.0.0/16"]
    //dns_servers = 
    subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
    security_group = azurerm_network_security_group.nsg01.id
  }  
  
}