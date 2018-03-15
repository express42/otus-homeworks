#!/bin/bash
EXIT_STATUS=0

./install_ruby.sh
./install_mongodb.sh
./deploy.sh
inspec exec otus-homeworks/homeworks/$BRANCH || EXIT_STATUS=$?

exit $EXIT_STATUS



