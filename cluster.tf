module "aks_cluster" {
  source              = "./aks-cluster"
  cluster_name        = "aks-test"
  location            = "East US"
  resource_group_name = "aks-rg"
  prefix              = "01"
  agents_pool_name    = "akspool"
  agents_size         = "Standard_DS2_v2"
  agents_pool_kubelet_configs = [{
    cpu_manager_policy      = "static",
    image_gc_high_threshold = "70",
    image_gc_low_threshold  = "60"
    }
  ]
  private_cluster_enabled = true
}