#!/bin/bash
set -e
cwd="`pwd`"

### parse command line arguments ###

shared=false

for key in "$@"; do
    case $key in
        --shared)
        shared=true
        ;;
    esac
done

### prepare an unprivileged user

### build and install tensorflow_cc ###

mkdir tensorflow_cc/tensorflow_cc/build
chown -R tensorflow_cc:tensorflow_cc tensorflow_cc/tensorflow_cc/build
chmod go+rX tensorflow_cc/tensorflow_cc/build
cd tensorflow_cc/tensorflow_cc/build


# build and install
make
rm -rf /home/tensorflow_cc/.cache
make install
cd "$cwd"
rm -rf tensorflow_cc/tensorflow_cc/build
