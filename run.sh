#!/bin/bash
GROUP=2018-02
BRANCH=$TRAVIS_PULL_REQUEST_BRANCH
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
  echo "..."
  echo "Run tests"
  ./$HOMEWORK_RUN
else
  echo "We don't have tests for this homework"
  exit 0
fi
