echo "Test Travis!"
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

inspec exec $SCRIPTPATH
