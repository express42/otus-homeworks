#!/bin/bash
echo HOMEWORK:$TRAVIS_BRANCH
./homeworks/$TRAVIS_BRANCH/run.sh
