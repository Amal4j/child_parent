resource "azurerm_virtual_network" "vn-2" {
    for_each = var.vn_c
    resource_group_name = each.value.resource_group_name
    name = each.value.name
    location = each.value.location
    address_space = each.value.address_space
  }