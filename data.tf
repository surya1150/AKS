data "azurerm_resource_group" "rg" {
  name = "aks-rg"
}
data "azurerm_subnet" "subnet" {
  name                 = "aks-subnet"
  virtual_network_name = "aka-private"
  resource_group_name  = "aks-rg"
}
# data "azurerm_virtual_network_gateway" "example" {
#   name                = "aks-vnet-24408013"
#   resource_group_name = "MC_aks-rg_aks-test_eastus"
#   subnet_ID           = "aks-subnet"
# }


# az aks get-credentials --resource-group MC_aks-rg_aks-test_eastus --name aks-test --admin --private-cluster --file .

# az aks get-credentials --resource-group aks-rg --name aks-test --admin --private-cluster --file ./config


# az aks get-credentials --resource-group <resource-group-name> --name <cluster-name> --admin --private-cluster --file <path-to-kubeconfig-file>


