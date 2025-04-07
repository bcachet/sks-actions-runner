resource "helm_release" "gha_runner_controller" {
  namespace        = "gh-actions-runner"
  create_namespace = true
  recreate_pods    = true
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

resource "helm_release" "gha_runner_scale_set" {
  depends_on = [
    helm_release.gha_runner_controller
  ]
  namespace        = "gh-actions-runner"
  create_namespace = true
  recreate_pods    = true
  reuse_values     = false
  name             = "runner-scale-set"
  repository       = "oci://ghcr.io/actions/actions-runner-controller-charts"
  chart            = "gha-runner-scale-set"
  version          = "0.11.0"
  set {
    name  = "githubConfigUrl"
    value = var.gha_org
  }
  set_sensitive {
    name  = "githubConfigSecret.github_token"
    value = var.gha_token
  }

  values = [
    <<-EOT
    podAnnotations:
      k8s.grafana.com/scrape: "true"
    EOT
  ]
}
