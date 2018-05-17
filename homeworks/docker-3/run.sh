#!/bin/bash
set -e

# Run InSpec
# Had to split because with > 10 min builds TravisCI fails
inspec exec otus-homeworks/homeworks/docker-3/structure.rb
inspec exec otus-homeworks/homeworks/docker-3/controls/build_comment.rb
inspec exec otus-homeworks/homeworks/docker-3/controls/build_post.rb
inspec exec otus-homeworks/homeworks/docker-3/controls/build_ui.rb
inspec exec otus-homeworks/homeworks/docker-3/docker.rb

# Show images & status
docker images
docker ps
