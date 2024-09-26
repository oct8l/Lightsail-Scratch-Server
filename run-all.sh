#!/bin/bash

##################################################################
## Make sure we're in the root directory when the script starts ##
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
cd "${SCRIPT_DIR}"
##################################################################


###################################################
## Generate a new ed25519 key to use with the VM ##
ssh-keygen -t ed25519 -C "Lightsail WireGuard server $(date +%Y-%m-%d-%H-%M-%S)" -f ./id_rsa -N ""
export TF_VAR_pubkey=`cat ./id_rsa.pub`
rm ./id_rsa.pub
###################################################


############################################################
## Go into the Terraform directory and provision the host ##
cd terraform
terraform init
terraform apply -auto-approve
############################################################


printf "\nALL DONE\n\n"
