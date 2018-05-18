#!/bin/bash
set -e

# Run InSpec
inspec exec otus-homeworks/homeworks/monitoring-1

# Show images & status
docker images
docker ps
