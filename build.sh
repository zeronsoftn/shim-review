#!/bin/bash

set -e

. config.sh

[ -d output ] && rm -rf output || true
[ -d review ] && rm -rf review || true
mkdir -p output review

SHIM_ARCHIVE_URL=https://github.com/rhboot/shim/releases/download/15.6/shim-15.6.tar.bz2
SHIM_ARCHIVE_FILE=shim-15.4.tar.bz2
SHIM_ARCHIVE_SHA256=eab91644a3efe91a666399f5d8eb3eed0e04d04f79d4b6c0b278ef7747a239a5

EFIDIR=ZeronsoftN

set -e

build_args=(buildx build --tag shim_build)
build_args+=(--build-arg SHIM_ARCHIVE_URL=${SHIM_ARCHIVE_URL})
build_args+=(--build-arg SHIM_ARCHIVE_FILE=${SHIM_ARCHIVE_FILE})
build_args+=(--build-arg SHIM_ARCHIVE_SHA256=${SHIM_ARCHIVE_SHA256})
build_args+=(--build-arg EFIDIR=${EFIDIR})
build_args+=(--output type=local,dest=output)
if [ "${BUILDX_USE_CACHE}" = "y" ]; then
	build_args+=(--cache-from=type=local,src=/tmp/.buildx-cache)
	build_args+=(--cache-to=type=local,dest=/tmp/.buildx-cache-new)
fi
build_args+=(.)

docker "${build_args[@]}" 2>&1 | tee review/build-log.txt

cp $(find output -type f -name "shim*.efi") review/

( cd review && sha256sum shim*.efi > hashs.txt )

