resource "azurerm_kubernetes_cluster" "main" {
  name                = "main"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  kubernetes_version  = "1.33.6"
  dns_prefix          = "dev"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
    auto_scaling_enabled = true
    min_count = 1
    max_count = 10
  }
  aci_connector_linux {
    subnet_name = "/subscriptions/52cd5f2c-0d28-4429-b80d-950089f20b98/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/project-setup-network/subnets/default"
  }

  identity {
    type = "SystemAssigned"
  }
}
