// Use the credentials from the Kubernetes Cluster referenced in the other file
provider "kubernetes" {
  version                = "=1.2.0"
  host                   = "${data.azurerm_kubernetes_cluster.existing.kube_config.0.host}"
  username               = "${data.azurerm_kubernetes_cluster.existing.kube_config.0.username}"
  password               = "${data.azurerm_kubernetes_cluster.existing.kube_config.0.password}"
  client_certificate     = "${base64decode(data.azurerm_kubernetes_cluster.existing.kube_config.0.client_certificate)}"
  client_key             = "${base64decode(data.azurerm_kubernetes_cluster.existing.kube_config.0.client_key)}"
  cluster_ca_certificate = "${base64decode(data.azurerm_kubernetes_cluster.existing.kube_config.0.cluster_ca_certificate)}"
  load_config_file       = false
}

resource "kubernetes_namespace" "example" {
  metadata {
    name = "ndc-sydney2018"
  }
}
