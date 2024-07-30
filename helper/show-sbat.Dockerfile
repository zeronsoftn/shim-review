FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    bash \
    grub-efi-amd64-bin \
    binutils

ARG DUMMY=
RUN echo "SBAT:" && objcopy -j .sbat -O binary /usr/lib/grub/x86_64-efi/monolithic/grubx64.efi /dev/stdout || echo "$DUMMY" > /dev/null

