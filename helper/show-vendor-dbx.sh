#!/usr/bin/env python3
"""Dump the contents of vendor_dbx.bin (EFI_SIGNATURE_LIST) so it can be reviewed.

Usage: ./helper/show-vendor-dbx.sh [vendor_dbx.bin]
"""
import hashlib
import os
import struct
import subprocess
import sys
import uuid

EFI_CERT_SHA256_GUID = uuid.UUID("c1c41626-504c-4092-aca9-41f936934328")
EFI_CERT_X509_GUID = uuid.UUID("a5c059a1-94e4-4aa7-87b5-ab155c2bf072")


def describe(list_type, payload):
    if list_type == EFI_CERT_SHA256_GUID:
        return "sha256=" + payload.hex()
    if list_type == EFI_CERT_X509_GUID:
        subject = subprocess.run(
            ["openssl", "x509", "-inform", "der", "-noout", "-subject"],
            input=payload, capture_output=True).stdout.decode().strip()
        return (f"x509 ({len(payload)} bytes, "
                f"fingerprint={hashlib.sha256(payload).hexdigest()}) {subject}")
    return payload.hex()

path = sys.argv[1] if len(sys.argv) > 1 else os.path.join(
    os.path.dirname(__file__), "..", "vendor_dbx.bin")

data = open(path, "rb").read()
off = 0
while off < len(data):
    list_type = uuid.UUID(bytes_le=data[off:off + 16])
    list_size, header_size, sig_size = struct.unpack("<III", data[off + 16:off + 28])
    count = (list_size - 28 - header_size) // sig_size
    print(f"SignatureType={list_type} SignatureListSize={list_size} "
          f"SignatureSize={sig_size} entries={count}")
    pos = off + 28 + header_size
    while pos < off + list_size:
        owner = uuid.UUID(bytes_le=data[pos:pos + 16])
        print(f"  owner={owner} {describe(list_type, data[pos + 16:pos + sig_size])}")
        pos += sig_size
    off += list_size
