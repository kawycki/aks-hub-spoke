# resource "azurerm_subnet_network_security_group_association" "spoke_one_le_subnet_association" {
#   network_security_group_id = azurerm_network_security_group.spoke_linkendpoints_nsg.id
#   subnet_id                 = azurerm_subnet.spoke_one_vnet_linkendpoints_subnet.id
# }

# resource "azurerm_subnet_network_security_group_association" "spoke_two_le_subnet_association" {
#   network_security_group_id = azurerm_network_security_group.spoke_linkendpoints_nsg.id
#   subnet_id                 = azurerm_subnet.spoke_two_vnet_linkendpoints_subnet.id
# }

# resource "azurerm_subnet_network_security_group_association" "spoke_one_resources_subnet_association" {
#   network_security_group_id = azurerm_network_security_group.spoke_resources_nsg.id
#   subnet_id                 = azurerm_subnet.spoke_one_vnet_resources_subnet.id
# }

# resource "azurerm_subnet_network_security_group_association" "spoke_two_resources_subnet_association" {
#   network_security_group_id = azurerm_network_security_group.spoke_resources_nsg.id
#   subnet_id                 = azurerm_subnet.spoke_two_vnet_resources_subnet.id
# }

# resource "azurerm_network_security_group" "bastion_nsg" {
#   location            = azurerm_resource_group.sandbox_rg.location
#   name                = "nsg-westeurope-bastion"
#   resource_group_name = azurerm_resource_group.sandbox_rg.name
# }

# resource "azurerm_bastion_host" "res-2" {
#   location            = "westeurope"
#   name                = "ab-westeurope-gylvm7nawowpw"
#   resource_group_name = "sandbox"
#   ip_configuration {
#     name                 = "hub-subnet"
#     public_ip_address_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.Network/publicIPAddresses/pip-ab-westeurope"
#     subnet_id            = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.Network/virtualNetworks/vnet-westeurope-hub/subnets/AzureBastionSubnet"
#   }
#   depends_on = [
#     azurerm_public_ip.res-26,
#     # One of azurerm_subnet.res-33,azurerm_subnet_network_security_group_association.res-34 (can't auto-resolve as their ids are identical)
#   ]
# }

# resource "azurerm_firewall_policy" "res-3" {
#   location                 = "westeurope"
#   name                     = "fw-policies-westeurope"
#   resource_group_name      = "sandbox"
#   threat_intelligence_mode = "Deny"
#   dns {
#     proxy_enabled = true
#   }
#   # insights {
#   #   default_log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   #   enabled                            = true
#   #   retention_in_days                  = 30
#   # }
#   # # threat_intelligence_allowlist {
#   # # }
#   # depends_on = [
#   #   azurerm_log_analytics_workspace.res-55,
#   # ]
# }

# resource "azurerm_firewall_policy_rule_collection_group" "res-5" {
#   firewall_policy_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.Network/firewallPolicies/fw-policies-westeurope"
#   name               = "DefaultNetworkRuleCollectionGroup"
#   priority           = 200
#   network_rule_collection {
#     action   = "Allow"
#     name     = "org-wide-allowed"
#     priority = 100
#     rule {
#       destination_addresses = ["*"]
#       destination_ports     = ["53"]
#       name                  = "DNS"
#       protocols             = ["UDP"]
#       source_addresses      = ["*"]
#     }
#   }
#   depends_on = [
#     azurerm_firewall_policy.res-3,
#   ]
# }
# resource "azurerm_firewall_policy_rule_collection_group" "res-4" {
#   firewall_policy_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.Network/firewallPolicies/fw-policies-westeurope"
#   name               = "DefaultApplicationRuleCollectionGroup"
#   priority           = 300
#   depends_on = [
#     azurerm_firewall_policy.res-3,
#   ]
# }
# resource "azurerm_firewall" "res-1" {
#   firewall_policy_id  = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.Network/firewallPolicies/fw-policies-westeurope"
#   location            = "westeurope"
#   name                = "fw-westeurope"
#   resource_group_name = "sandbox"
#   sku_name            = "AZFW_VNet"
#   sku_tier            = "Standard"
#   zones               = ["1"]
#   ip_configuration {
#     name                 = "pip-fw-westeurope-00"
#     public_ip_address_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.Network/publicIPAddresses/pip-fw-westeurope-00"
#     subnet_id            = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.Network/virtualNetworks/vnet-westeurope-hub/subnets/AzureFirewallSubnet"
#   }
#   depends_on = [
#     azurerm_firewall_policy.res-3,
#     azurerm_public_ip.res-27,
#     # azurerm_public_ip.res-28,
#     # azurerm_public_ip.res-29,
#     azurerm_subnet.res-35,
#   ]
# }


# resource "azurerm_network_security_rule" "res-15" {
#   access                      = "Allow"
#   description                 = "Service Requirement. Allow Required Session and Certificate Validation."
#   destination_address_prefix  = "Internet"
#   destination_port_range      = "80"
#   direction                   = "Outbound"
#   name                        = "AllowBastionCertificateValidationOutbound"
#   network_security_group_name = "nsg-westeurope-bastion"
#   priority                    = 140
#   protocol                    = "*"
#   resource_group_name         = "sandbox"
#   source_address_prefix       = "*"
#   source_port_range           = "*"
#   depends_on = [
#     azurerm_network_security_group.res-14,
#   ]
# }
# resource "azurerm_network_security_rule" "res-16" {
#   access                      = "Allow"
#   description                 = "Service Requirement. Allow Required Host to Host Communication."
#   destination_address_prefix  = "VirtualNetwork"
#   destination_port_ranges     = ["5701", "8080"]
#   direction                   = "Inbound"
#   name                        = "AllowBastionHostToHostInbound"
#   network_security_group_name = "nsg-westeurope-bastion"
#   priority                    = 130
#   protocol                    = "*"
#   resource_group_name         = "sandbox"
#   source_address_prefix       = "VirtualNetwork"
#   source_port_range           = "*"
#   depends_on = [
#     azurerm_network_security_group.res-14,
#   ]
# }
# resource "azurerm_network_security_rule" "res-18" {
#   access                      = "Allow"
#   description                 = "Service Requirement. Allow control plane access. Regional Tag not yet supported."
#   destination_address_prefix  = "*"
#   destination_port_range      = "443"
#   direction                   = "Inbound"
#   name                        = "AllowControlPlaneInbound"
#   network_security_group_name = "nsg-westeurope-bastion"
#   priority                    = 110
#   protocol                    = "Tcp"
#   resource_group_name         = "sandbox"
#   source_address_prefix       = "GatewayManager"
#   source_port_range           = "*"
#   depends_on = [
#     azurerm_network_security_group.res-14,
#   ]
# }

# resource "azurerm_network_security_rule" "res-11" {
#   access                      = "Allow"
#   destination_address_prefix  = "VirtualNetwork"
#   destination_port_ranges     = ["3389"]
#   direction                   = "Inbound"
#   name                        = "AllowBastionRdpFromHub"
#   network_security_group_name = "nsg-spoke-resources"
#   priority                    = 100
#   protocol                    = "Tcp"
#   resource_group_name         = "sandbox"
#   source_address_prefix       = "10.0.1.0/26"
#   source_port_range           = "*"
#   depends_on = [
#     azurerm_network_security_group.res-10,
#   ]
# }

# resource "azurerm_network_security_rule" "res-12" {
#   access                      = "Allow"
#   destination_address_prefix  = "VirtualNetwork"
#   destination_port_ranges     = ["22"]
#   direction                   = "Inbound"
#   name                        = "AllowBastionSshFromHub"
#   network_security_group_name = "nsg-spoke-resources"
#   priority                    = 110
#   protocol                    = "Tcp"
#   resource_group_name         = "sandbox"
#   source_address_prefix       = "10.0.1.0/26"
#   source_port_range           = "*"
#   depends_on = [
#     azurerm_network_security_group.res-10,
#   ]
# }
# resource "azurerm_network_security_rule" "res-17" {
#   access                      = "Allow"
#   description                 = "Service Requirement. Allow Required Host to Host Communication."
#   destination_address_prefix  = "VirtualNetwork"
#   destination_port_ranges     = ["5701", "8080"]
#   direction                   = "Outbound"
#   name                        = "AllowBastionHostToHostOutbound"
#   network_security_group_name = "nsg-westeurope-bastion"
#   priority                    = 130
#   protocol                    = "*"
#   resource_group_name         = "sandbox"
#   source_address_prefix       = "VirtualNetwork"
#   source_port_range           = "*"
#   depends_on = [
#     azurerm_network_security_group.res-14,
#   ]
# }
# resource "azurerm_network_security_rule" "res-19" {
#   access                      = "Allow"
#   description                 = "Required for control plane outbound. Regional prefix not yet supported"
#   destination_address_prefix  = "AzureCloud"
#   destination_port_range      = "443"
#   direction                   = "Outbound"
#   name                        = "AllowControlPlaneOutbound"
#   network_security_group_name = "nsg-westeurope-bastion"
#   priority                    = 120
#   protocol                    = "Tcp"
#   resource_group_name         = "sandbox"
#   source_address_prefix       = "*"
#   source_port_range           = "*"
#   depends_on = [
#     azurerm_network_security_group.res-14,
#   ]
# }
# resource "azurerm_network_security_rule" "res-20" {
#   access                      = "Allow"
#   description                 = "Service Requirement. Allow Health Probes."
#   destination_address_prefix  = "*"
#   destination_port_range      = "443"
#   direction                   = "Inbound"
#   name                        = "AllowHealthProbesInbound"
#   network_security_group_name = "nsg-westeurope-bastion"
#   priority                    = 120
#   protocol                    = "Tcp"
#   resource_group_name         = "sandbox"
#   source_address_prefix       = "AzureLoadBalancer"
#   source_port_range           = "*"
#   depends_on = [
#     azurerm_network_security_group.res-14,
#   ]
# }
# resource "azurerm_network_security_rule" "res-22" {
#   access                      = "Allow"
#   description                 = "Allow SSH out to the virtual network"
#   destination_address_prefix  = "VirtualNetwork"
#   destination_port_range      = "22"
#   direction                   = "Outbound"
#   name                        = "AllowSshToVnetOutbound"
#   network_security_group_name = "nsg-westeurope-bastion"
#   priority                    = 100
#   protocol                    = "Tcp"
#   resource_group_name         = "sandbox"
#   source_address_prefix       = "*"
#   source_port_range           = "*"
#   depends_on = [
#     azurerm_network_security_group.res-14,
#   ]
# }
# resource "azurerm_network_security_rule" "res-21" {
#   access                      = "Allow"
#   description                 = "Allow RDP out to the virtual network"
#   destination_address_prefix  = "VirtualNetwork"
#   destination_port_range      = "3389"
#   direction                   = "Outbound"
#   name                        = "AllowRdpToVnetOutbound"
#   network_security_group_name = "nsg-westeurope-bastion"
#   priority                    = 110
#   protocol                    = "Tcp"
#   resource_group_name         = "sandbox"
#   source_address_prefix       = "*"
#   source_port_range           = "*"
#   depends_on = [
#     azurerm_network_security_group.res-14,
#   ]
# }
# resource "azurerm_network_security_rule" "res-23" {
#   access                      = "Allow"
#   description                 = "Allow our users in. Update this to be as restrictive as possible."
#   destination_address_prefix  = "*"
#   destination_port_range      = "443"
#   direction                   = "Inbound"
#   name                        = "AllowWebExperienceInbound"
#   network_security_group_name = "nsg-westeurope-bastion"
#   priority                    = 100
#   protocol                    = "Tcp"
#   resource_group_name         = "sandbox"
#   source_address_prefix       = "Internet"
#   source_port_range           = "*"
#   depends_on = [
#     azurerm_network_security_group.res-14,
#   ]
# }

# resource "azurerm_network_security_rule" "res-25" {
#   access                      = "Deny"
#   description                 = "No further outbound traffic allowed."
#   destination_address_prefix  = "*"
#   destination_port_range      = "*"
#   direction                   = "Outbound"
#   name                        = "DenyAllOutbound"
#   network_security_group_name = "nsg-westeurope-bastion"
#   priority                    = 1000
#   protocol                    = "*"
#   resource_group_name         = "sandbox"
#   source_address_prefix       = "*"
#   source_port_range           = "*"
#   depends_on = [
#     azurerm_network_security_group.res-14,
#   ]
# }
# resource "azurerm_network_security_rule" "res-24" {
#   access                      = "Deny"
#   description                 = "No further inbound traffic allowed."
#   destination_address_prefix  = "*"
#   destination_port_range      = "*"
#   direction                   = "Inbound"
#   name                        = "DenyAllInbound"
#   network_security_group_name = "nsg-westeurope-bastion"
#   priority                    = 1000
#   protocol                    = "*"
#   resource_group_name         = "sandbox"
#   source_address_prefix       = "*"
#   source_port_range           = "*"
#   depends_on = [
#     azurerm_network_security_group.res-14,
#   ]
# }

# resource "azurerm_subnet_network_security_group_association" "res-34" {
#   network_security_group_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.Network/networkSecurityGroups/nsg-westeurope-bastion"
#   subnet_id                 = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.Network/virtualNetworks/vnet-westeurope-hub/subnets/AzureBastionSubnet"
#
# }