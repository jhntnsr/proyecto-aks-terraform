# Le decimos a Terraform que usaremos Azure
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}
provider "azurerm" {
  features {}
}

# 1. Creamos una "caja" (Resource Group) para guardar nuestro proyecto
resource "azurerm_resource_group" "aks_rg" {
  name     = "mi-aks-recursos"
  location = "East US 2" # Puedes usar esta región
}

# 2. Creamos el edificio (El cluster de Kubernetes)
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "mi-cluster-aks"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "miaks"

  # Le decimos qué tipo de computadoras usar (pequeñas para ahorrar dinero)
  default_node_pool {
    name       = "default"
    node_count = 1 
    vm_size = "Standard_D2s_v3" 
  }

  identity {
    type = "SystemAssigned"
  }

  # Le damos la llave digital que creaste en el paso 3
  linux_profile {
    admin_username = "ubuntu"
    ssh_key {
      key_data = file("aks_key.pub")
    }
  }
}

# 3. Le pedimos a Terraform que nos devuelva el control remoto al terminar
output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  sensitive = true
}