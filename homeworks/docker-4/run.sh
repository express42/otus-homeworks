#!/bin/bash
set -e

# Run InSpec
# workaround for builds > 10 min
inspec exec otus-homeworks/homeworks/docker-4/controls/structure.rb
inspec exec otus-homeworks/homeworks/docker-4/controls/build_ui.rb
inspec exec otus-homeworks/homeworks/docker-4/controls/build_post.rb
inspec exec otus-homeworks/homeworks/docker-4/controls/build_comment.rb
inspec exec otus-homeworks/homeworks/docker-4/controls/docker.rb

# Show images & status
docker images
docker ps
