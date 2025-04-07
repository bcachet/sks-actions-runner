resource "exoscale_sks_cluster" "sks" {
  zone           = var.zone
  name           = var.name
  version        = var.kube_version
  description    = "${var.name} / ${var.zone}"
}
