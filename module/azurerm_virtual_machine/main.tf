# data "azurerm_public_ip" "ip" {
#   for_each = var.vm-5
#   name                = each.value.pip_name
#   resource_group_name = each.value.resource_group_name
# } 
 data "azurerm_network_interface" "nic_card" {
    for_each = var.vm-5
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}


resource "azurerm_linux_virtual_machine" "vm_amal" {
  for_each = var.vm-5
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  zone = "2"
  admin_username      = each.value.admin_username
  admin_password =  each.value.admin_password
  disable_password_authentication  = false
  network_interface_ids = [
    data.azurerm_network_interface.nic_card[each.key].id,
  ]

 

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}