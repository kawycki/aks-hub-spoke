resource "azurerm_firewall_policy" "firewall" {
  name                = "${local.fw_name}-policy"
  location            = azurerm_resource_group.sandbox_rg.location
  resource_group_name = azurerm_resource_group.sandbox_rg.name
  sku                 = "Basic"
  # github.com/hashicorp/terraform-provider-azurerm/issues/9620
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

# resource "azurerm_firewall" "firewall" {
#   name                = local.fw_name
#   location            = azurerm_resource_group.sandbox_rg.location
#   resource_group_name = azurerm_resource_group.sandbox_rg.name
#   sku_tier            = "Basic"
#   sku_name            = "AZFW_VNet"
#   firewall_policy_id  = azurerm_firewall_policy.firewall.id

#   management_ip_configuration {
#     name = "default"
#     subnet_id = element(azurerm_virtual_network.hub_vnet.subnet.*.id, 2)
#     public_ip_address_id = azurerm_public_ip.firewall_pip.id
#   }
# }

resource "azurerm_network_security_group" "spoke_linkendpoints_nsg" {
  location            = azurerm_resource_group.sandbox_rg.location
  name                = "nsg-spoke-privatelinkendpoints"
  resource_group_name = azurerm_resource_group.sandbox_rg.name
}

resource "azurerm_network_security_rule" "spoke_linkendpoints_nsg_deny_all_inbound_rule" {
  access                      = "Deny"
  destination_address_prefix  = "*"
  destination_port_range      = "*"
  direction                   = "Inbound"
  name                        = "DenyAllInbound"
  network_security_group_name = azurerm_network_security_group.spoke_linkendpoints_nsg.name
  priority                    = 1000
  protocol                    = "*"
  resource_group_name         = azurerm_resource_group.sandbox_rg.name
  source_address_prefix       = "*"
  source_port_range           = "*"
}

resource "azurerm_network_security_rule" "spoke_linkendpoints_nsg_allow_all_443_rule" {
  access                      = "Allow"
  destination_address_prefix  = "VirtualNetwork"
  destination_port_range      = "443"
  direction                   = "Inbound"
  name                        = "AllowAll443InFromVnet"
  network_security_group_name = azurerm_network_security_group.spoke_linkendpoints_nsg.name
  priority                    = 100
  protocol                    = "Tcp"
  resource_group_name         = azurerm_resource_group.sandbox_rg.name
  source_address_prefix       = "VirtualNetwork"
  source_port_range           = "*"
}

resource "azurerm_network_security_rule" "spoke_linkendpoints_nsg_deny_all_outbound_rule" {
  access                      = "Deny"
  destination_address_prefix  = "*"
  destination_port_range      = "*"
  direction                   = "Outbound"
  name                        = "DenyAllOutbound"
  network_security_group_name = azurerm_network_security_group.spoke_linkendpoints_nsg.name
  priority                    = 1000
  protocol                    = "*"
  resource_group_name         = azurerm_resource_group.sandbox_rg.name
  source_address_prefix       = "*"
  source_port_range           = "*"
}

resource "azurerm_network_security_group" "spoke_resources_nsg" {
  location            = azurerm_resource_group.sandbox_rg.location
  name                = "nsg-spoke-resources"
  resource_group_name = azurerm_resource_group.sandbox_rg.name
}

resource "azurerm_network_security_rule" "spoke_resources_nsg_deny_all_inbound_rule" {
  access                      = "Deny"
  destination_address_prefix  = "*"
  destination_port_range      = "*"
  direction                   = "Inbound"
  name                        = "DenyAllInBound"
  network_security_group_name = azurerm_network_security_group.spoke_resources_nsg.name
  priority                    = 1000
  protocol                    = "*"
  resource_group_name         = azurerm_resource_group.sandbox_rg.name
  source_address_prefix       = "*"
  source_port_range           = "*"
}
