#!/bin/bash

printf "\nBegin Deployment of AWS Lambda.\n"

function finish {
    rv=$?
    printf "\nDeployment completed with code ${rv}\n"
}

trap finish EXIT

current_directory=$(dirname $0)
pushd ${current_directory}

set -e

echo "Initialising Terraform."
terraform init \
    -backend=true \
    -backend-config="access_key=${AWS_ACCESS_KEY}" \
    -backend-config="secret_key=${AWS_SECRET_KEY}"

echo "Planning Terraform."
terraform plan \
    -out=output.tfplan

echo "Applying Terraform."
terraform apply \
    -auto-approve \
    "output.tfplan"

