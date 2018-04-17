#!/bin/bash
set -e

# Install requirements
cd ansible && ansible-galaxy install -r environments/stage/requirements.yml && cd ..

# Run InSpec
inspec exec otus-homeworks/homeworks/ansible-4
