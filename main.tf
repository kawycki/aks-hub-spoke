locals {
  fw_name = "hub-fw"
}
resource "azurerm_resource_group" "sandbox_rg" {
  location = "westeurope"
  name     = "sandbox"
}
