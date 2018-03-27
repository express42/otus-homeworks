#!/bin/bash

set -e

# Create keys
touch ~/.ssh/appuser.pub ~/.ssh/appuser

# Run InSpec
inspec exec otus-homeworks/homeworks/terraform-2
