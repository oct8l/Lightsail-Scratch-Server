#!/bin/bash

export ScrachIP=`cat terraform/terraform.tfstate | jq -r '.resources[0] .instances[0] .attributes .public_ip_address'`

ssh ubuntu@$ScrachIP -i id_ed25519 -o "StrictHostKeyChecking no"
