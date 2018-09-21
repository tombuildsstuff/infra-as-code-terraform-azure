provider "azurerm" {
  version = "=1.15.0"
}

# Documentation on the Kubernetes Data Source: https://terraform.io/docs/providers/azurerm/d/kubernetes_cluster.html
data "azurerm_kubernetes_cluster" "existing" {
  name                = "ndc-sydneyk8s"
  resource_group_name = "ndc-sydney-manual"
}

/*
The KubeConfig can be returned by calling:

```
az aks get-credentials --resource-group ndc-sydney-manual --name ndc-sydneyk8s
```

Once that's done - the Kubernetes Dashboard can then be seen by running:

```
az aks browse --resource-group ndc-sydney-manual --name ndc-sydneyk8s
```
*/

