BRANCH=master
VERSION=kinetic
HAND_TYPE=none

while [[ $# > 1 ]]
do
key="$1"

case $key in
    -b|--buildtoolsbranch)
        BRANCH="$2"
        shift # past argument
        ;;
    -v|--rosversion)
        VERSION="$2"
        shift # past argument
        ;;
    -h|--handtype)
        HAND_TYPE="$2"
        shift
        ;;
    *)
    # unknown option
    ;;
esac
shift # past argument or value
done

case $HAND_TYPE in
    e|E)
        LOCATIONS="/home/user/projects/shadow_robot/base/src/sr_interface/sr_moveit_hand_config/ /home/user/projects/shadow_robot/base/src/sr_interface/sr_multi_moveit/sr_multi_moveit_config/"
        ;;
    h|H)
        LOCATIONS="locations"
        ;;
    *)
        echo "error, no/wrong hand type given"
        exit 1
        ;;
esac


echo "Downloading seed tarball"
wget -O /tmp/preseed.tgz https://github.com/shadow-robot/sr-build-tools/raw/$(echo $BRANCH | sed 's/#/%23/g')/bin/preseed_default_warehouse_db.tgz

echo "Unzipping"
for location in $LOCATIONS; do
    pushd $location
    tar zxf /tmp/preseed.tgz 
    chown -R $MY_USERNAME:$MY_USERNAME default_warehouse_mongo_db
    popd
done
