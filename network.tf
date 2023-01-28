resource "azurerm_virtual_network" "hub_vnet" {
  address_space       = ["10.0.0.0/22"]
  location            = azurerm_resource_group.sandbox_rg.location
  name                = "vnet-westeurope-hub"
  resource_group_name = azurerm_resource_group.sandbox_rg.name
}

resource "azurerm_subnet" "hub_vnet_bastion_subnet" {
  address_prefixes     = ["10.0.1.0/26"]
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.sandbox_rg.name
  virtual_network_name = azurerm_virtual_network.hub_vnet.name
}

resource "azurerm_subnet" "hub_vnet_gateway_subnet" {
  address_prefixes     = ["10.0.2.0/27"]
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.sandbox_rg.name
  virtual_network_name = azurerm_virtual_network.hub_vnet.name
}

resource "azurerm_subnet" "hub_vnet_firewall_subnet" {
  address_prefixes     = ["10.0.3.0/26"]
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.sandbox_rg.name
  virtual_network_name = azurerm_virtual_network.hub_vnet.name
}

resource "azurerm_route_table" "hub_route_table" {
  location            = azurerm_resource_group.sandbox_rg.location
  name                = "route-to-westeurope-hub-fw"
  resource_group_name = azurerm_resource_group.sandbox_rg.name
}

resource "azurerm_route" "hub_route_table_route" {
  address_prefix         = "0.0.0.0/0"
  name                   = "r-nexthop-to-fw"
  next_hop_in_ip_address = "10.0.3.4"
  next_hop_type          = "VirtualAppliance"
  resource_group_name    = azurerm_resource_group.sandbox_rg.name
  route_table_name       = azurerm_route_table.hub_route_table.name
}

resource "azurerm_virtual_network" "spoke_one_vnet" {
  address_space       = ["10.100.0.0/22"]
  location            = azurerm_resource_group.sandbox_rg.location
  name                = "vnet-westeurope-spoke-one"
  resource_group_name = azurerm_resource_group.sandbox_rg.name
}

resource "azurerm_subnet" "spoke_one_vnet_resources_subnet" {
  address_prefixes     = ["10.100.0.0/24"]
  name                 = "snet-resources"
  resource_group_name  = azurerm_resource_group.sandbox_rg.name
  virtual_network_name = azurerm_virtual_network.spoke_one_vnet.name
}

resource "azurerm_subnet" "spoke_one_vnet_linkendpoints_subnet" {
  address_prefixes     = ["10.100.1.0/26"]
  name                 = "snet-privatelinkendpoints"
  resource_group_name  = azurerm_resource_group.sandbox_rg.name
  virtual_network_name = azurerm_virtual_network.spoke_one_vnet.name
}

resource "azurerm_virtual_network" "spoke_two_vnet" {
  address_space       = ["10.200.0.0/22"]
  location            = azurerm_resource_group.sandbox_rg.location
  name                = "vnet-westeurope-spoke-two"
  resource_group_name = azurerm_resource_group.sandbox_rg.name
}

resource "azurerm_subnet" "spoke_two_vnet_resources_subnet" {
  address_prefixes     = ["10.200.0.0/24"]
  name                 = "snet-resources"
  resource_group_name  = azurerm_resource_group.sandbox_rg.name
  virtual_network_name = azurerm_virtual_network.spoke_two_vnet.name
}

resource "azurerm_subnet" "spoke_two_vnet_linkendpoints_subnet" {
  address_prefixes     = ["10.200.1.0/26"]
  name                 = "snet-privatelinkendpoints"
  resource_group_name  = azurerm_resource_group.sandbox_rg.name
  virtual_network_name = azurerm_virtual_network.spoke_two_vnet.name
}

# resource "azurerm_subnet_route_table_association" "one_vnet_resource_subnet_table_association" {
#   route_table_id = azurerm_route_table.hub_route_table.id
#   subnet_id      = azurerm_subnet.spoke_one_vnet_resources_subnet.id
# }

# resource "azurerm_subnet_route_table_association" "two_vnet_resource_subnet_table_association" {
#   route_table_id = azurerm_route_table.hub_route_table.id
#   subnet_id      = azurerm_subnet.spoke_two_vnet_resources_subnet.id
# }

# resource "azurerm_subnet_route_table_association" "one_vnet_linkendpoints_subnet_table_association" {
#   route_table_id = azurerm_route_table.hub_route_table.id
#   subnet_id      = azurerm_subnet.spoke_one_vnet_linkendpoints_subnet.id
# }

# resource "azurerm_subnet_route_table_association" "two_vnet_linkendpoints_subnet_table_association" {
#   route_table_id = azurerm_route_table.hub_route_table.id
#   subnet_id      = azurerm_subnet.spoke_two_vnet_linkendpoints_subnet.id
# }

resource "azurerm_virtual_network_peering" "spoke_one_to_hub_vnet_peering" {
  name                      = "spoke_one_to_hub_vnet"
  remote_virtual_network_id = azurerm_virtual_network.hub_vnet.id
  resource_group_name       = azurerm_resource_group.sandbox_rg.name
  virtual_network_name      = azurerm_virtual_network.spoke_one_vnet.name
}

resource "azurerm_virtual_network_peering" "spoke_two_to_hub_vnet_peering" {
  name                      = "spoke_one_to_hub_vnet"
  remote_virtual_network_id = azurerm_virtual_network.hub_vnet.id
  resource_group_name       = azurerm_resource_group.sandbox_rg.name
  virtual_network_name      = azurerm_virtual_network.spoke_two_vnet.name
}

resource "azurerm_virtual_network_peering" "hub_vnet_to_spoke_one_peering" {
  name                      = "hub_vnet_to_spoke_one"
  remote_virtual_network_id = azurerm_virtual_network.spoke_one_vnet.id
  resource_group_name       = azurerm_resource_group.sandbox_rg.name
  virtual_network_name      = azurerm_virtual_network.hub_vnet.name
}

resource "azurerm_virtual_network_peering" "hub_vnet_to_spoke_two_peering" {
  name                      = "hub_vnet_to_spoke_two"
  remote_virtual_network_id = azurerm_virtual_network.spoke_two_vnet.id
  resource_group_name       = azurerm_resource_group.sandbox_rg.name
  virtual_network_name      = azurerm_virtual_network.hub_vnet.name
}

# resource "azurerm_public_ip" "firewall_pip" {
#   allocation_method   = "Static"
#   location            = azurerm_resource_group.sandbox_rg.location
#   name                = "pip-fw-westeurope-00"
#   resource_group_name = azurerm_resource_group.sandbox_rg.name
#   sku                 = "Standard"
# }