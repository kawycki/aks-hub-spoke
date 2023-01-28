# resource "azurerm_storage_account" "thanos_bucket" {
#   name                     = "kwthanosbucket"
#   resource_group_name      = azurerm_resource_group.sandbox_rg.name
#   location                 = azurerm_resource_group.sandbox_rg.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }