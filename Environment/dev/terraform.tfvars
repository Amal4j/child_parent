rg_p = {
  rg1 = {
    name     = "dev-rg"
    location = "uaenorth"
  }
  rg2 = {
    name     = "prod-rg"
    location = "centralindia"
  }
}
vn_p = {
  vnet-1 = {
    name                = "dev-vnet"
    location            = "uaenorth"
    resource_group_name = "dev-rg"
    address_space       = ["10.0.0.0/16"]
  }
  vnet-2 = {
    name                = "prod-vnet"
    location            = "centralindia"
    resource_group_name = "prod-rg"
    address_space       = ["20.0.0.0/16"]
  }
}
sn_p = {
  snet1 = {
    name                 = "dev-subnet"
    resource_group_name  = "dev-rg"
    virtual_network_name = "dev-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
  snet2 = {
    name                 = "prod-subnet"
    resource_group_name  = "prod-rg"
    virtual_network_name = "prod-vnet"
    address_prefixes     = ["20.0.2.0/24"]
  }


}
# # vnic_p = {
# #   nic1 = {
# #     name                 = "dev-nic"
# #     location             = "uaenorth"
# #     resource_group_name  = "dev-rg"
# #     pip_name             = "dev-ip"
# #     virtual_network_name = "dev-vnet"
# #     subnet_name          = "dev-subnet"

# #   }
# #   nic2 = {
# #     name                 = "prod-nic"
# #     location             = "centralindia"
# #     resource_group_name  = "prod-rg"
# #     pip_name             = "prod-ip"
# #     virtual_network_name = "prod-vnet"
# #     subnet_name          = "prod-subnet"

#    }
# }

ip_p = {
  ip_dev = {
    pip_name            = "dev-ip"
    resource_group_name = "dev-rg"
    location            = "uaenorth"
    allocation_method   = "Static"
  }
  ip_prod = {
    pip_name            = "prod-ip"
    resource_group_name = "prod-rg"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}

vm_p = {
  vm1 = {
    name                 = "dev-vm-01"
    resource_group_name  = "dev-rg"
    location             = "uaenorth"
    size                 = "Standard_D2s_v3"
    admin_username       = "test123"
    admin_password       = "Password@123"
    nic_name             = "dev-nic"
    subnet_name          = "dev-subnet"
    pip_name             = "dev-ip"
    virtual_network_name = "dev-vnet"
  }
  vm2 = {
    name                 = "prod-01-01"
    resource_group_name  = "prod-rg"
    location             = "centralindia"
    size                 = "Standard_D2s_v3"
    admin_username       = "test123"
    admin_password       = "Password@123"
    nic_name             = "prod-nic"
    subnet_name          = "prod-subnet"
    pip_name             = "prod-ip"
    virtual_network_name = "prod-vnet"
  }

}

peering_p_1_2 = {

  p12 = {
    name                 = "peer1to2"
    resource_group_name  = "dev-rg"
    virtual_network_name = "dev-vnet"
  }
}
peering_p_2_1 = {
  p21 = {
    name                 = "peeer2to1"
    resource_group_name  = "prod-rg"
    virtual_network_name = "prod-vnet"
  }
}

fir_p = {
  fir1 = {
    pip_name             = "dev-ip"
    resource_group_name  = "dev-rg"
    location             = "uaenorth"
    subnet_name          = "dev-subnet"
    virtual_network_name = "dev-vnet"
    name                 = "dev_firewall"

  }

  fir2 = {
    pip_name             = "prod-ip"
    resource_group_name  = "prod-rg"
    location             = "centralindia"
    subnet_name          = "prod-subnet"
    virtual_network_name = "prod-vnet"
    name                 = "prod_firewall"
  }
}