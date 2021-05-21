terraform {
  backend "azurerm" {
    resource_group_name  = "MY-VM"
    storage_account_name = "myvmdisks"
    container_name       = "terraformstate"
    key = "terrafrom.tfstate"
    access_key     = "uGUVrKDC7RMx23QSWv9f4sbZz8SG8f6GNVYnyjK2R0A5lVLbxPwHRCZ+YLMznkFe25wPDtI42xH3s3CiznnbpA=="
  }
}

data "azurerm_resource_group" "rg" {
  name = "ankush"
}


resource "azurerm_managed_disk" "disk" {
  count = 5
  name                 = "OS-Disk0${count.index}"
  resource_group_name  = data.azurerm_resource_group.rg.name
  location             = data.azurerm_resource_group.rg.location
  storage_account_type = var.type
  create_option        = "Empty"
  disk_size_gb         = var.disksize

}

##### Splat Expressions Example

output "Disk-Name" {
  value = azurerm_managed_disk.disk[*].name
}

output "Disk-Size" {
  value = azurerm_managed_disk.disk[*].disk_size_gb
}

output "Disk-Location" {
  value = azurerm_managed_disk.disk[*].location
  }

output "Combine" {
  value = zipmap(azurerm_managed_disk.disk[*].name,azurerm_managed_disk.disk[*].location)
}
