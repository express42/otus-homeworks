#!/bin/bash
set -e

# Run InSpec
inspec exec otus-homeworks/homeworks/docker-3/controls/build_comment.rb
inspec exec otus-homeworks/homeworks/docker-3/controls/build_post.rb
inspec exec otus-homeworks/homeworks/docker-3/controls/build_ui.rb
inspec exec otus-homeworks/homeworks/docker-3

# Show images & status
docker images
docker ps
