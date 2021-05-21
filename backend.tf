terraform {
  backend "azurerm" {
    resource_group_name  = "MY-VM"
    storage_account_name = "myvmdisks"
    container_name       = "terraformstate"
    key = "terrafrom.tfstate"
    access_key     = "uGUVrKDC7RMx23QSWv9f4sbZz8SG8f6GNVYnyjK2R0A5lVLbxPwHRCZ+YLMznkFe25wPDtI42xH3s3CiznnbpA=="
  }
}
