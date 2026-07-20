resource "azurerm_subnet" "sn_3" {
  for_each = var.sn_c
  name = each.value.name
  resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes = each.value.address_prefixes
}