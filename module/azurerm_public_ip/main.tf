resource "azurerm_public_ip" "ip" {
    for_each  = var.pip_c
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location 
    allocation_method   = each.value.allocation_method

}