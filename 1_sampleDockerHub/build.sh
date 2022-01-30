set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=leomarx
# image name
IMAGE=myalluracourse
# set version to build
VERSION=`cat VERSION`

docker build -t $USERNAME/$IMAGE:$VERSION .
