#!/bin/bash
GROUP=2018-02
BRANCH=$TRAVIS_PULL_REQUEST_BRANCH

echo GROUP:$GROUP

if [ "$BRANCH" == "" ];
then
  echo "We don't have tests for master branch"
  exit 0
fi

echo HOMEWORK:$BRANCH

echo "Clone repository with tests"
git clone -b $GROUP --single-branch https://github.com/express42/otus-homeworks.git

if [ -f ./otus-homeworks/homeworks/$BRANCH/run.sh ]; then
  echo "Install Docker"
  echo "..."
  echo "Run tests"
else
  echo "We don't have tests for this homework"
  exit 0
fi
