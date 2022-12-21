resource "azurerm_resource_group" "ccs_az_nsg" {
  name     = "ccsaznsg"
  location = "West Europe"
}

resource "azurerm_network_security_group" "ccs_az_nsg_nsg" {
  name                = "ccsaznsgnsg"
  location            = azurerm_resource_group.ccs_az_nsg.location
  resource_group_name = azurerm_resource_group.ccs_az_nsg.name
}
resource "azurerm_network_security_rule" "ccs_az_nsg_rule1" {
  name                        = "ccsaznsgrule1"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Icmp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.ccs_az_nsg.name
  network_security_group_name = azurerm_network_security_group.ccs_az_nsg_nsg.name
}
resource "azurerm_network_security_rule" "ccs_az_nsg_rule2" {
  name                        = "ccsaznsgrule2"
  priority                    = 102
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.ccs_az_nsg.name
  network_security_group_name = azurerm_network_security_group.ccs_az_nsg_nsg.name
}
# resource "azurerm_network_security_rule" "ccs_az_nsg_rule3" {
#   name                        = "ccsaznsgrule3"
#   priority                    = 103
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "Udp"
#   source_port_range           = "*"
#   destination_port_range      = "*"
#   source_address_prefix       = "*"
#   destination_address_prefix  = "*"
#   resource_group_name         = azurerm_resource_group.ccs_az_nsg.name
#   network_security_group_name = azurerm_network_security_group.ccs_az_nsg_nsg.name
# }