#! /usr/bin/bash

CWD=`pwd`
ROOT=`git rev-parse --show-toplevel`

# Move to root to generate project if needed
if [[ $CWD != $ROOT ]]; then
    cd $ROOT
fi

swift package generate-xcodeproj
open *.xcodeproj

# Move back if needed
cd $CWD
