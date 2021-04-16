#!/bin/bash

set -e

mkdir -p build output/${SHIM_TARGET_ARCH}

( \
  cd build && \
  tar --strip-components=1 -xf /tmp/${SHIM_ARCHIVE_FILE} && \
  make VENDOR_CERT_FILE=/tmp/vendor_cert.der -j4 && \
  make DESTDIR=../output/${SHIM_TARGET_ARCH} EFIDIR=${EFIDIR} install
)

