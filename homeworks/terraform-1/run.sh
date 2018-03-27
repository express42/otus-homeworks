#!/bin/bash
set -e

# Create keys
touch $(awk -F '=' '/^public_key_path/ { print $2 }' terraform/terraform.tfvars.example)
touch $(awk -F '=' '/^private_key_path/ { print $2 }' terraform/terraform.tfvars.example)

# Run InSpec
inspec exec otus-homeworks/homeworks/terraform-1
