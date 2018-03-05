#!/bin/bash
echo HOMEWORK:$TRAVIS_PULL_REQUEST_BRANCH

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
