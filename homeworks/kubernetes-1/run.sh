#!/bin/bash
set -e

# Run InSpec
# workaround for builds > 10 min
inspec exec otus-homeworks/homeworks/kubernetes-1/controls/structure.rb
inspec exec otus-homeworks/homeworks/kubernetes-1/controls/deployments.rb

# Show images & status
docker images
docker ps