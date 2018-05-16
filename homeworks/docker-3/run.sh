#!/bin/bash
set -e

# Run InSpec
inspec exec otus-homeworks/homeworks/docker-3

# Show images & status
docker images
docker ps
