FROM ubuntu:20.04
MAINTAINER Joseph Lee <joseph@zeronsoftn.com>

ENV DEBIAN_FRONTEND=noninteractive
ARG APT_REPO=

RUN mkdir -p /work && \
    echo "\n\
deb $APT_REPO focal main restricted universe multiverse\n\
deb $APT_REPO focal-updates main restricted universe multiverse\n\
deb $APT_REPO focal-backports main restricted universe multiverse\n\
deb $APT_REPO focal-security main restricted universe multiverse\n\
" | tee /etc/apt/sources.list && \
    apt-get update -y && \
    apt-get install -y \
      ca-certificates openssl coreutils bash curl tar xz-utils bzip2 git sed diffutils patch make pesign \
      libelf-dev \
      binutils-x86-64-linux-gnu gcc \
      binutils-aarch64-linux-gnu gcc-aarch64-linux-gnu

ARG SHIM_ARCHIVE_URL=
ARG SHIM_ARCHIVE_FILE=
ARG SHIM_ARCHIVE_SHA256=

COPY [ "vendor_cert.der", "sbat.csv", "/tmp/" ]
COPY [ "patches", "/tmp/patches" ]
RUN cd /tmp && \
    set -x  && \
    curl -L -o "/tmp/${SHIM_ARCHIVE_FILE}" "${SHIM_ARCHIVE_URL}" && \
    echo "${SHIM_ARCHIVE_SHA256} ${SHIM_ARCHIVE_FILE}" | sha256sum -c

WORKDIR /work

RUN mkdir -p /work/output && \
    dpkg -l | tee /work/output/builder-packages.txt

ARG EFIDIR=
RUN tar --strip-components=1 -xf "/tmp/${SHIM_ARCHIVE_FILE}" && \
    (for name in $(find /tmp/patches -type f -name "*.patch" | sort); do patch -p1 < $name; done) && \
    mkdir -p build-x86_64/data build-ia32/data build-aarch64/data output/x86_64 output/ia32 output/aarch64 && \
    cp -f /tmp/sbat.csv data/sbat.csv && \
    cp /tmp/sbat.csv build-x86_64/data/sbat.csv && \
    cp /tmp/sbat.csv build-ia32/data/sbat.csv && \
    cp /tmp/sbat.csv build-aarch64/data/sbat.csv

RUN make -C build-x86_64 TOPDIR=.. ARCH=x86_64 VENDOR_CERT_FILE=/tmp/vendor_cert.der EFIDIR=${EFIDIR} DESTDIR=/work/output/x86_64 ENABLE_SHIM_HASH=true -f ../Makefile install
RUN make -C build-ia32 TOPDIR=.. ARCH=ia32 VENDOR_CERT_FILE=/tmp/vendor_cert.der EFIDIR=${EFIDIR} DESTDIR=/work/output/ia32 ENABLE_SHIM_HASH=true -f ../Makefile install
RUN make -C build-aarch64 TOPDIR=.. ARCH=aarch64 CROSS_COMPILE=aarch64-linux-gnu- VENDOR_CERT_FILE=/tmp/vendor_cert.der EFIDIR=${EFIDIR} DESTDIR=/work/output/aarch64 ENABLE_SHIM_HASH=true -f ../Makefile install
RUN objcopy -j .sbat -O binary /work/output/x86_64/boot/efi/EFI/ZeronsoftN/shimx64.efi /tmp/shimx64-sbat.csv && sed -i 's/\x0//g' /tmp/shimx64-sbat.csv && \
    objcopy -j .sbat -O binary /work/output/ia32/boot/efi/EFI/ZeronsoftN/shimia32.efi /tmp/shimia32-sbat.csv && sed -i 's/\x0//g' /tmp/shimia32-sbat.csv && \
    diff /tmp/shimx64-sbat.csv /tmp/sbat.csv && \
    diff /tmp/shimia32-sbat.csv /tmp/sbat.csv || ( >&2 echo "SBAT IS NOT APPLIED CORRECTLY"; exit 1 )

RUN for name in $(find /work/output/ -type f -name "shim*.efi"); do echo "PESIGN($name): "; pesign --hash --padding --in=$name; echo "SHA256SUM:"; sha256sum $name; echo; done
RUN cd /work/output && tar -cf /work/output/output.tar x86_64 ia32 aarch64

