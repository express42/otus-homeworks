#!/bin/bash
GROUP=2018-02
BRANCH=${TRAVIS_PULL_REQUEST_BRANCH:-$TRAVIS_BRANCH}
HOMEWORK_RUN=./otus-homeworks/homeworks/$BRANCH/run.sh
REPO=https://github.com/express42/otus-homeworks.git
DOCKER_IMAGE=express42/otus-homeworks

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
  # sudo apt-get install openssh-client -y
  # curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  # sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  # sudo apt-get update
  # sudo apt-get -y install docker-ce
  echo "Run tests"

  docker run -d -v $(pwd):/srv --cap-add=NET_ADMIN -p 33433:22 --privileged --device /dev/net/tun --name hw-test $DOCKER_IMAGE  /sbin/init
  docker exec -ti hw-test /bin/bash -c "BRANCH=$BRANCH $HOMEWORK_RUN"

  # ssh -i id_rsa_test -p 33433 root@localhost "cd /srv && BRANCH=$BRANCH $HOMEWORK_RUN"
else
  echo "We don't have tests for this homework"
  exit 0
fi
