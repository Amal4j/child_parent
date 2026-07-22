data "azurerm_subnet" "snet" {
    for_each = var.fir
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "ip" {
  for_each = var.fir
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
 
}


resource "azurerm_firewall" "example" {
    for_each = var.fir
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.snet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.ip[each.key].id
  }
}