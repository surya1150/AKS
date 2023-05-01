module "aks_cluster" {
  source                  = "./aks-cluster"
  resource_group_name     = data.azurerm_resource_group.rg.name
  location                = data.azurerm_resource_group.rg.location
  cluster_name            = "test-cluster-aks"
  prefix                  = "test-cluster"
  agents_pool_name        = "akspool"
  agents_size             = "Standard_D2_v2"
  private_cluster_enabled = true
  agents_pool_kubelet_configs = [{
    cpu_manager_policy      = "static",
    image_gc_high_threshold = "70",
    image_gc_low_threshold  = "60"
    }
  ]
  tags = {
    name = "test-cluster-aks"
  }
  vnet_subnet_id = data.azurerm_subnet.subnet.id
  network_plugin = "kubenet"
  network_policy = "calico"
  net_profile_pod_cidr       = "100.245.0.0/16"
  net_profile_service_cidr   = "100.244.0.0/16"
  net_profile_dns_service_ip = "100.244.0.5"
}
