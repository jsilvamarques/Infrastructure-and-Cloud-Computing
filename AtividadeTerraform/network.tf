resource "azurerm_virtual_network" "vnet_atividade_tf" {
    name                = "vnet"
    address_space       = ["10.80.0.0/16"]
    location            = var.location
    resource_group_name = azurerm_resource_group.rg_atividade_tf.name

    tags = {
        environment = "Atividade Terraform"
    }

    depends_on = [ azurerm_resource_group.rg_atividade_tf ]
}

resource "azurerm_subnet" "subnet_atividade_tf" {
    name                 = "subnet"
    resource_group_name  = azurerm_resource_group.rg_atividade_tf.name
    virtual_network_name = azurerm_virtual_network.vnet_atividade_tf.name
    address_prefixes       = ["10.80.4.0/24"]

    depends_on = [ azurerm_resource_group.rg_atividade_tf, azurerm_virtual_network.vnet_atividade_tf ]
}

resource "azurerm_network_security_group" "sg_atividade_tf" {
    name                = "networkSecurityGroup"
    location            = var.location
    resource_group_name = azurerm_resource_group.rg_atividade_tf.name

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    security_rule {
        name                       = "HTTPInbound"
        priority                   = 1002
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3306"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    security_rule {
        name                       = "HTTPOutbound"
        priority                   = 1003
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3306"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    tags = {
        environment = "Atividade Terraform"
    }

    depends_on = [ azurerm_resource_group.rg_atividade_tf ]
}