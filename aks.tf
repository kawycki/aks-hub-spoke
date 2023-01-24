# resource "azurerm_kubernetes_cluster" "spoke_one_workload_k8s" {
#   name                = "workload-aks"
#   resource_group_name = azurerm_resource_group.sandbox_rg.name
#   location            = azurerm_resource_group.sandbox_rg.location
#   dns_prefix          = "workload"

#   network_profile {
#     network_plugin    = "azure"
#     load_balancer_sku = "standard"
#     outbound_type     = "userDefinedRouting"
#   }

#   auto_scaler_profile {
#     balance_similar_node_groups = false
#   }

#   default_node_pool {
#     name                = "pool0"
#     vm_size             = "Standard_B2ms"
#     enable_auto_scaling = true
#     min_count           = 2
#     max_count           = 3

#     vnet_subnet_id = azurerm_subnet.spoke_one_vnet_resources_subnet.id
#   }

#   identity {
#     type = "SystemAssigned"
#   }

#   lifecycle {
#     ignore_changes = [
#       default_node_pool[0].node_count
#     ]
#     # using this, because "prevent_destroy" would block "terraform destroy"
#     # create_before_destroy          = true
#   }
# }

# resource "azurerm_kubernetes_cluster" "spoke_two_workload_k8s" {
#   name                = "workload-aks"
#   resource_group_name = azurerm_resource_group.sandbox_rg.name
#   location            = azurerm_resource_group.sandbox_rg.location
#   dns_prefix          = "workload"

#   network_profile {
#     network_plugin    = "azure"
#     load_balancer_sku = "standard"
#     outbound_type     = "userDefinedRouting"
#   }

#   auto_scaler_profile {
#     balance_similar_node_groups = false
#   }

#   default_node_pool {
#     name                = "pool0"
#     vm_size             = "Standard_B2ms"
#     enable_auto_scaling = true
#     min_count           = 2
#     max_count           = 3

#     vnet_subnet_id = azurerm_subnet.spoke_two_vnet_resources_subnet.id
#   }

#   identity {
#     type = "SystemAssigned"
#   }

#   lifecycle {
#     ignore_changes = [
#       default_node_pool[0].node_count
#     ]
#     # using this, because "prevent_destroy" would block "terraform destroy"
#     # create_before_destroy          = true
#   }
# }