#!/bin/bash

read -p "Build dataplicity agent from PyPi? " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

mkdir -p bin
rm bin/dataplicity
virtualenv -qq .build
source .build/bin/activate
pip -q install pex==1.1.14
echo building ./bin/dataplicity
pex dataplicity -r requirements.txt -o bin/dataplicity -m dataplicity.app:main
deactivate
echo build dataplicity agent v`./bin/dataplicity version`