#!/bin/sh
#
set -eu pipefail

KEY_ID=D4CF81D8

apt-ftparchive packages . > Packages

gzip -k -f Packages

apt-ftparchive release . > Release

gpg --default-key ${KEY_ID} -abs -o - Release > Release.gpg
gpg --default-key ${KEY_ID} --clearsign -o - Release > InRelease
