#!/bin/bash
GROUP=2018-02
BRANCH=${TRAVIS_PULL_REQUEST_BRANCH:-$TRAVIS_BRANCH}
HOMEWORK_RUN=./otus-homeworks/homeworks/$BRANCH/run.sh
REPO=https://github.com/express42/otus-homeworks.git

echo GROUP:$GROUP

if [ "$BRANCH" == "" ];
then
  echo "We don't have tests for master branch"
  exit 0
fi

echo HOMEWORK:$BRANCH

echo "Clone repository with tests"
git clone -b $GROUP --single-branch $REPO

if [ -f $HOMEWORK_RUN ]; then
  echo "Install Docker"
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  sudo apt-get update
  sudo apt-get -y install docker-ce

  echo "Run tests"
  docker run -v $(pwd):/srv postgred/otus $HOMEWORK_RUN
else
  echo "We don't have tests for this homework"
  exit 0
fi
