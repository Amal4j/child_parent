data "azurerm_virtual_network" "pee" {
  for_each = var.pee
    name                = each.value.name
  resource_group_name = each.value.resource_group_name
}
resource "azurerm_virtual_network_peering" "peering-1" {
    for_each = var.peering_c_1_2
  name                      = each.value.name
  resource_group_name       = each.value.resource_group_name
  virtual_network_name      = each.value.virtual_network_name
  remote_virtual_network_id = [azurerm_virtual_network.peering-2.id]
}

resource "azurerm_virtual_network_peering" "peering-2" {
    for_each = var.peering_c_2_1
  name                      = each.value.name
  resource_group_name       = each.value.resource_group_name
  virtual_network_name      = each.value.virtual_network_name
  remote_virtual_network_id = [azurerm_virtual_network.peering-1.id]
}