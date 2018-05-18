#!/bin/bash
set -e

# Run InSpec
inspec exec otus-homeworks/homeworks/docker-4

# Show images & status
docker images
docker ps
