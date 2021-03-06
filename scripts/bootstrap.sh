#!/bin/bash

set -e

# Remember the PWD.
CWD=$(pwd)

# Clone Notary.
cd $GOPATH/src
if [ -d "github.com/theupdateframework/notary" ]
then
    echo "Notary src already cloned..."
else
    mkdir -p github.com/theupdateframework
    cd github.com/theupdateframework
    git clone git@github.com:theupdateframework/notary.git
fi

# Restore PWD.
cd $CWD

# We will sign and push this to our localhost Notary and Registry.
echo "Pulling hello-world..."
docker pull hello-world
docker tag hello-world localhost:5000/hello-world

echo "Listing all images..."
docker images