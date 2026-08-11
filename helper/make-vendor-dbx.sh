#!/bin/sh
# Build vendor_dbx.bin (an EFI_SIGNATURE_LIST of Authenticode SHA-256 hashes)
# from the binaries that this shim must refuse to load.
#
# Usage: ./helper/make-vendor-dbx.sh OLD1.efi [OLD2.efi ...]
# Output: vendor_dbx.bin in the repository root
#
# Requires: efitools (hash-to-efi-sig-list)
# Verify the result with: ./helper/show-vendor-dbx.sh

set -eu

if [ $# -lt 1 ]; then
	echo "usage: $0 BINARY.efi [BINARY.efi ...]" >&2
	exit 1
fi

top=$(dirname "$0")/..
hash-to-efi-sig-list "$@" "$top/vendor_dbx.bin"
echo "wrote $top/vendor_dbx.bin"
