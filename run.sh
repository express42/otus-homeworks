#!/bin/bash
echo HOMEWORK:$TRAVIS_PULL_REQUEST_BRANCH
HOMEWORK_RUN="./homeworks/$TRAVIS_PULL_REQUEST_BRANCH/run.sh"

echo "Clone repository with tests"
git clone https://github.com/express42/otus-homeworks.git .

ls -l

if [ -f homeworks/$TRAVIS_PULL_REQUEST_BRANCH/run.sh ]; then
  echo "Install Docker"
  echo "..."
  ./homeworks/$TRAVIS_PULL_REQUEST_BRANCH/run.sh
else
  echo "We don't have tests for this homework"
  exit 0
fi
