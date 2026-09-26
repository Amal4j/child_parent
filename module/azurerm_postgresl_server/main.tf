resource "azurerm_postgresql_flexible_server" "db-learning" {
    for_each = var.db_c
  name                          = each.value.db_name
  resource_group_name           = each.value.resource_group_name
  location                  = each.value.location
  version                       = each.value.version
#   delegated_subnet_id           = azurerm_subnet.example.id
#   private_dns_zone_id           = azurerm_private_dns_zone.example.id
#   public_network_access_enabled = false
administrator_login           = "admin123"
administrator_password        = "Admin@123"
#   zone                          = "1"

#   storage_mb   = 32768
#   storage_tier = "P4"

#   sku_name   = "B_Standard_B1ms"
#   depends_on = [azurerm_private_dns_zone_virtual_network_link.example]

}