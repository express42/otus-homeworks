#!/bin/bash
set -e

# Run InSpec
# workaround for builds > 10 min
inspec exec otus-homeworks/homeworks/kubernetes-3/controls/structure.rb
inspec exec otus-homeworks/homeworks/kubernetes-3/controls/reddit.rb

# Show images & status
docker images
docker ps