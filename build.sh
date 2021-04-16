#!/bin/bash

export BUILDING_IMAGE_NAME=zeron-shim-builder
export SUDO= # 4(which sudo)

[ -d output ] && rm -rf output
[ -d review ] && rm -rf review
mkdir -p output review

${SUDO} docker rmi "${BUILDING_IMAGE_NAME}" || true

set -e

/bin/bash ./_build_impl.sh | tee review/build-log.txt

( cd output && tar -xf output.tar )

cp $(find output -type f -name "shim*.efi") review/
( cd review && sha256sum shim*.efi > hashs.txt )

