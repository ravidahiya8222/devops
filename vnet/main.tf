resource "azurerm_virtual_network" "net" {
  name                = var.vnet_name
  location            = var.vnet_location
  resource_group_name = var.resource_group_name
  address_space       = var.space
}