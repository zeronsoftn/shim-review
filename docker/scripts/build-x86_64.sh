#!/bin/bash

set -e

mkdir -p build-x86_64 build-ia32 output/x86_64 output/ia32

# Build 64-bit
( \
  cd build-x86_64 && \
  tar --strip-components=1 -xf /tmp/${SHIM_ARCHIVE_FILE} && \
  make ARCH=x86_64 VENDOR_CERT_FILE=/tmp/vendor_cert.der -j4 && \
  make ARCH=x86_64 DESTDIR=../output/x86_64 EFIDIR=${EFIDIR} install
)

# Build 32-bit
( \
  cd build-ia32 && \
  tar --strip-components=1 -xf /tmp/${SHIM_ARCHIVE_FILE} && \
  make ARCH=ia32 VENDOR_CERT_FILE=/tmp/vendor_cert.der -j4 && \
  make ARCH=ia32 DESTDIR=../output/ia32 EFIDIR=${EFIDIR} install
)

