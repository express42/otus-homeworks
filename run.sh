#!/bin/bash
echo HOMEWORK:$TRAVIS_PULL_REQUEST_BRANCH
HOMEWORK_RUN="./homeworks/$TRAVIS_PULL_REQUEST_BRANCH/run.sh"

if [ -f $HOMEWORK_PATH ]; then
  echo "Install Docker"
  echo "Clone repository with tests"
  echo "..."
  ./homeworks/$TRAVIS_PULL_REQUEST_BRANCH/run.sh
else
  echo "We don't have tests for this homework"
  exit 0
fi
