#!/bin/bash

#########################
## Delete the SSH keys ##
rm id_ed25519*
#########################


#############################################
## Set a junk variable so destroying works ##
export TF_VAR_pubkey=junk
#############################################


############################################################
## Go into the Terraform directory and provision the host ##
cd terraform
terraform destroy -auto-approve
############################################################

rm terraform/terraform.tfstate
rm terraform/terraform.tfstate.backup

printf "\n\e[32m---------\nALL GONE\n---------\e[0m\n\n"
