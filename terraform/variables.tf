# requires TF_VAR_exoscale_api_key env var
# eg: `TF_VAR_exoscale_api_key=foo terraform apply`
variable "exoscale_api_key" {
}

# requires TF_VAR_exoscale_secret_key env var
# eg: `TF_VAR_exoscale_secret_key=foo terraform apply`
variable "exoscale_secret_key" {
}

variable "kube_version" {
    description = "Version of the Kubernetes cluster"
    type        = string
    default     = ""
    # when default is an empty string, the latest kubernetes version available is used
}

variable "name" {
    description = "Name of the cluster"
    type        = string
    default     = "actions-runner"
}

variable "workers_number" {
    description = "Number of workers in node pool"
    type        = number
    default     = 3
}

variable "worker_type" {
    type    = string
    default = "standard.medium"
}

variable "zone" {
    type    = string
    default = "ch-zrh-1"
}