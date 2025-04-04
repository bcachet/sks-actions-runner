## Secrets handling

```shell
bw login
# Exoscale IAM key to deploy our infra
SECRETS=$(bw get item SKSActionsRunner)
export TF_VAR_exoscale_api_key=$(echo $SECRETS | jq -r '.fields[] | select(.name == "EXO_IAM_KEY").value')
export TF_VAR_exoscale_secret_key=$(echo $SECRETS | jq -r '.fields[] | select(.name == "EXO_IAM_SECRET").value')
```

## Creating instructure with Terraform

```shell
(cd terraform && \
    terraform init && \
    terraform apply)
```
