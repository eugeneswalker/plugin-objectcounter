#!/bin/bash

export PATH=$PATH:/usr/local/tau2/arm64_linux/bin
export PROFILE_DIR=$(pwd)/profiles

echo Launching tau_python
tau_python /app/app.py $@

echo Collecting profile files
mkdir -p $PROFILE_DIR
mv profile.* $PROFILE_DIR/

echo Creating tarball
tar czvf profiles.tgz $PROFILE_DIR

echo Uploading tarball
python3 upload.py --file-path ./profiles.tgz

echo Success!
