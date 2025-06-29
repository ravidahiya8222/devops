resource "azurerm_resource_group" "rj" {
    name = var.resource_group_name
    location = var.resource_group_location
}

resource "azurerm_resource_group" "rj2" {
    name     = var.resource_group_name2
    location = var.resource_group_location2
}