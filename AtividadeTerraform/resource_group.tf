resource "azurerm_resource_group" "rg_atividade_tf" {
    name     = "resourceGroup"
    location = var.location

    tags = {
        environment = "Atividade Terraform"
    }
}