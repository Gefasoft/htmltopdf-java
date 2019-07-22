#!/bin/bash

# needs to be eecuted outside docker

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

mkdir -p /tmp/wkhtmltopdf
cd /tmp/wkhtmltopdf

git clone --recurse-submodules https://github.com/wkhtmltopdf/wkhtmltopdf
git clone https://github.com/wkhtmltopdf/packaging

cd packaging
./build compile-docker bionic-amd64 ../wkhtmltopdf/ bla

# publish lib -> htmltopdf-java/src/main/resources/wkhtmltox/0.12.5/libwkhtmltox.so
cp bla/wkhtmltox/lib/libwkhtmltox.so $SCRIPTPATH/libwkhtmltox.so

rm -rf /tmp/wkhtmltopdf

