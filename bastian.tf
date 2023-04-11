# resource "azurerm_network_interface" "example" {
#   name                = "example-nic"
#   location            = "East US"
#   resource_group_name = data.azurerm_virtual_network_gateway.example.resource_group_name

#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = data.azurerm_virtual_network_gateway.example.subnet_id
#     private_ip_address_allocation = "Dynamic"
#   }
# }

# resource "azurerm_linux_virtual_machine" "example" {
#   name                = "example-machine"
#   resource_group_name = data.azurerm_virtual_network_gateway.example.resource_group_name
#   location            = "East US"
#   size                = "Standard_F2"
#   admin_username      = "adminuser"
#   network_interface_ids = [
#     azurerm_network_interface.example.id,
#   ]

#   admin_ssh_key {
#     username   = "adminuser"
#     public_key = file("~/.ssh/id_rsa.pub")
#   }

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "UbuntuServer"
#     sku       = "16.04-LTS"
#     version   = "latest"
#   }
# }