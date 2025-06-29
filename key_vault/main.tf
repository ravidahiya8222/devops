resource "azurerm_key_vault" "key" {
  name                        = var.vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = "0764505e-69bd-4239-bdb8-e97e276c0768"
  sku_name = "standard"

  access_policy {
    tenant_id = "0764505e-69bd-4239-bdb8-e97e276c0768"
    object_id = data.azurerm_client_config.client.object_id
   

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}