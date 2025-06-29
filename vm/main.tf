resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.nic_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.ip_configuration_name
    subnet_id                     = data.azurerm_subnet.data_subnet.id
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id          = azurerm_public_ip.pubic_ip.id
  }
}
resource "azurerm_public_ip" "pubic_ip" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.ip_location
  allocation_method   = var.allocation_method
}

resource "azurerm_linux_virtual_machine" "example" {
  name                = var.vm_name  
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = "adminuser"
  admin_password = "user@123"
  network_interface_ids = [azurerm_network_interface.nic.id,]
  disable_password_authentication = false

 

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = "latest"
  }
}