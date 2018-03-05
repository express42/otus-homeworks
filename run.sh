#!/bin/bash
echo GROUP:2018-02
echo BRANCH:$TRAVIS_PULL_REQUEST_BRANCH

if [ "$TRAVIS_PULL_REQUEST_BRANCH" == "" ];
then
  echo "We don't have tests for master branch"
  exit 0
fi

echo "Clone repository with tests"
git clone -b 2018-02 --single-branch https://github.com/express42/otus-homeworks.git

if [ -f ./otus-homeworks/homeworks/$TRAVIS_PULL_REQUEST_BRANCH/run.sh ]; then
  echo "Install Docker"
  echo "..."
  echo "Run tests"
else
  echo "We don't have tests for this homework"
  exit 0
fi
