module "resource_group" {
  source = "../../module/azurerm_resource_group"
  rg     = var.rg_p
}
module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_virtual_network"
  vn_c       = var.vn_p
}
module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../module/azurerm_subnet"
  sn_c       = var.sn_p
}
module "ip" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_public_ip"
  pip_c      = var.ip_p
}
module "nic" {
  depends_on = [module.virtual_network]
  source     = "../../module/azurerm_network_interface"
  vnet_c     = var.vnic_p
}
module "vm" {
  source = "../../module/azurerm_virtual_machine"
  vm-5   = var.vm_p
}