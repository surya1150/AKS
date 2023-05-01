Add kubectl package:
1. azureuser@private:~$ curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
2. azureuser@private:~$ echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
3. azureuser@private:~$ sudo apt-get update
4. azureuser@private:~$ sudo apt-get install -y kubectl
Installing Azure CLI:

1. azureuser@private:~$ sudo apt-get install -y apt-transport-https

2. azureuser@private:~$ curl -sL https://packages.microsoft.com/keys/microsoft.asc | \
>     gpg --dearmor | \
>     sudo tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null

3. azureuser@private:~$ AZ_REPO=$(lsb_release -cs); \
>     echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
>     sudo tee /etc/apt/sources.list.d/azure-cli.list
deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ focal main
4. azureuser@private:~$ sudo apt-get update

azureuser@private:~$ sudo apt-get install -y azure-cli

azureuser@private:~$ az --version

===================================
# Steps to connect to Private cluster:

# Reference: https://learn.microsoft.com/en-us/azure/aks/command-invoke?source=recommendations
# Issues Reference: https://learn.microsoft.com/en-us/troubleshoot/azure/azure-kubernetes/resolve-az-aks-command-invoke-failures
az aks command invoke \
  --resource-group aks-rg \
  --name test-cluster-aks \
  --command "kubectl get pods -n kube-system"

Example: az aks command invoke \
  --resource-group aks-rg \
  --name test-cluster-aks \
  --command "kubectl get logs cloud-node-manager-vnccc -n kube-system" 