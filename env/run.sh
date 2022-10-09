#!/usr/bin/env bash

AWS_ACCESS_KEY_ID="$ARGOCD_AWS_ACCESS_KEY_ID"
AWS_DEFAULT_REGION="$ARGOCD_AWS_DEFAULT_REGION"
AWS_SECRET_ACCESS_KEY="$ARGOCD_AWS_SECRET_ACCESS_KEY"

if [[ -z "$AWS_ACCESS_KEY_ID" ]]; then
  echo "ARGOCD_AWS_ACCESS_KEY_ID must be set to proceed"
  exit 1
fi

if [[ -z "$AWS_DEFAULT_REGION" ]]; then
  echo "ARGOCD_AWS_DEFAULT_REGION must be set to proceed"
  exit 1
fi

if [[ -z "$AWS_SECRET_ACCESS_KEY" ]]; then
  echo "ARGOCD_AWS_SECRET_ACCESS_KEY must be set to proceed"
  exit 1
fi

kubectl create secret generic argocd-aws-credentials \
  --from-literal=AWS_DEFAULT_REGION="$AWS_DEFAULT_REGION" \
  --from-literal=AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID" \
  --from-literal=AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY" \
  --namespace=argocd