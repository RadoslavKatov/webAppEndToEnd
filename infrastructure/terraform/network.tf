resource "azurerm_virtual_network" "webapp-ete-vnet" {
  name                = "webapp-ete-vnet"
  location            = azurerm_resource_group.webapp-ete-rg.location
  resource_group_name = azurerm_resource_group.webapp-ete-rg.name
  address_space       = ["10.0.0.0/16"]
}

# Subnet
resource "azurerm_subnet" "webapp-ete-subnet" {
  name                 = "webapp-ete-subnet"
  resource_group_name  = azurerm_resource_group.webapp-ete-rg.name
  virtual_network_name = azurerm_virtual_network.webapp-ete-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Public IP for VM
resource "azurerm_public_ip" "webapp-ete-puip" {
  name                = "webapp-ete-puip"
  resource_group_name = azurerm_resource_group.webapp-ete-rg.name
  location            = azurerm_resource_group.webapp-ete-rg.location
  allocation_method   = "Static"
}

# Network Interface
resource "azurerm_network_interface" "webapp-ete-nic" {
  name                = "webapp-ete-nic"
  location            = azurerm_resource_group.webapp-ete-rg.location
  resource_group_name = azurerm_resource_group.webapp-ete-rg.name

  ip_configuration {
    name                          = "webapp-ete-config"
    subnet_id                     = azurerm_subnet.webapp-ete-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.webapp-ete-puip.id
  }
}