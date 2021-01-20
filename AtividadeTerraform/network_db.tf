resource "azurerm_public_ip" "public_ip_atividade_tf_db" {
    name                         = "publicIPDB"
    location                     = var.location
    resource_group_name          = azurerm_resource_group.rg_atividade_tf.name
    allocation_method            = "Static"
    idle_timeout_in_minutes = 30

    tags = {
        environment = "Atividade Terraform"
    }

    depends_on = [ azurerm_resource_group.rg_atividade_tf ]
}

resource "azurerm_network_interface" "nic_atividade_tf_db" {
    name                      = "NICDB"
    location                  = var.location
    resource_group_name       = azurerm_resource_group.rg_atividade_tf.name

    ip_configuration {
        name                          = "nicConfigurationDB"
        subnet_id                     = azurerm_subnet.subnet_atividade_tf.id
        private_ip_address_allocation = "Static"
        private_ip_address            = "10.80.4.10"
        public_ip_address_id          = azurerm_public_ip.public_ip_atividade_tf_db.id
    }

    tags = {
        environment = "Atividade Terraform"
    }

    depends_on = [ azurerm_resource_group.rg_atividade_tf, azurerm_subnet.subnet_atividade_tf ]
}

resource "azurerm_network_interface_security_group_association" "nicsq_atividade_tf_db" {
    network_interface_id      = azurerm_network_interface.nic_atividade_tf_db.id
    network_security_group_id = azurerm_network_security_group.sg_atividade_tf.id

    depends_on = [ azurerm_network_interface.nic_atividade_tf_db, azurerm_network_security_group.sg_atividade_tf ]
}

data "azurerm_public_ip" "ip_atividade_tf_data_db" {
  name                = azurerm_public_ip.public_ip_atividade_tf_db.name
  resource_group_name = azurerm_resource_group.rg_atividade_tf.name
}