resource "azurerm_postgresql_flexible_server" "db-learning" {

  for_each = var.db_c

  name                = each.value.db_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  create_mode = "Default"

  version = each.value.version

  administrator_login    = each.value.administrator_login
  administrator_password = each.value.administrator_password

  sku_name   = each.value.sku_name
  storage_mb = each.value.storage_mb

  backup_retention_days        = 7
  geo_redundant_backup_enabled = false

  public_network_access_enabled = true

  auto_grow_enabled = false
}