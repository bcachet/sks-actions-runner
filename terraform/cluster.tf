resource "exoscale_sks_cluster" "sks" {
  zone           = var.zone
  name           = var.name
  version        = var.kube_version
  description    = "Cluster ${var.name} / ${var.zone}"
  service_level  = "starter"
  cni            = "cilium"
  exoscale_ccm   = true
  exoscale_csi   = true
  metrics_server = true
}
