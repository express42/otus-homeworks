#!/bin/bash
echo HOMEWORK:$TRAVIS_PULL_REQUEST_BRANCH
HOMEWORK_RUN="./homeworks/$TRAVIS_PULL_REQUEST_BRANCH/run.sh"

echo "Clone repository with tests"
git clone https://github.com/express42/otus-homeworks.git

ls -l

if [ -f otus-homeworks/homeworks/$TRAVIS_PULL_REQUEST_BRANCH/run.sh ]; then
  echo "Install Docker"
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  sudo apt-get update
  sudo apt-get -y install docker-ce

  echo "Run InSpec"
  docker run --rm -v $(pwd):/share chef/inspect sh "ls -l"
  docker run --rm -v $(pwd):/share chef/inspec sh otus-homeworks/homeworks/$TRAVIS_PULL_REQUEST_BRANCH/run.sh
else
  echo "We don't have tests for this homework"
  exit 0
fi
