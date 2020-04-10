#!/bin/bash

source "scripts/variables.sh"

terraform refresh -var-file=etc/bluedata_infra.tfvars \
   -var="client_cidr_block=$(curl -s http://ifconfig.me/ip)/32"  && \
terraform output -json > generated/output.json && \
./scripts/post_refresh_or_apply.sh

