#!/bin/bash

export PROFILE_DIR=$(pwd)/profiles

tau_python /app/app.py $@

mkdir -p $PROFILE_DIR
mv profile.* $PROFILE_DIR/
tar czvf profiles.tgz $PROFILE_DIR

python3 upload.py --file-path ./profiles.tgz
