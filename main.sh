#! /bin/bash

DEBIAN_FRONTEND=noninteractive

# Clone Upstream
git clone https://gitlab.freedesktop.org/xorg/proto/xcbproto.git -b xcb-proto-1.16.0
cp -rvf ./debian ./xcbproto/
cd ./xcbproto/

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
