resource "helm_release" "actions-runner-controller" {
  namespace        = "arc-systems"
  create_namespace = true
  reuse_values     = false
  name             = "actions-runner-controller"
  repository       = "oci://ghcr.io/actions/actions-runner-controller-charts"
  chart            = "gha-runner-scale-set-controller"
  version          = "0.11.0"

  values = [
    <<-EOT
    podAnnotations:
      k8s.grafana.com/scrape: "true"
    EOT
  ]
}
