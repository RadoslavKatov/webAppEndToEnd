# Define the Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "webapp-ete-vm" {
  name                = "webapp-ete-vm"
  resource_group_name = azurerm_resource_group.webapp-ete-rg.name
  location            = azurerm_resource_group.webapp-ete-rg.location
  size                = "Standard_B2s"
  admin_username      = "azureuser"

  # Use your SSH public key (update the path as needed)
  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  # Attach the Network Interface
  network_interface_ids = [
    azurerm_network_interface.webapp-ete-nic.id
  ]

  # OS Disk Configuration
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  # Use Ubuntu as the OS
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  tags = {
    environment = "dev"
  }
}