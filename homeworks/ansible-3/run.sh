#!/bin/bash
set -e

# Check versions
ansible --version
ansible-lint --version
packer version

# Run InSpec
inspec exec otus-homeworks/homeworks/ansible-3
