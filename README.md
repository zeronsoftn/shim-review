This repo is for review of requests for signing shim.  To create a request for review:

- clone this repo
- edit the template below
- add the shim.efi to be signed
- add build logs
- add any additional binaries/certificates/SHA256 hashes that may be needed
- commit all of that
- tag it with a tag of the form "myorg-shim-arch-YYYYMMDD"
- push that to github
- file an issue at https://github.com/rhboot/shim-review/issues with a link to your tag
- approval is ready when the "accepted" label is added to your issue

Note that we really only have experience with using GRUB2 or systemd-boot on Linux, so
asking us to endorse anything else for signing is going to require some convincing on
your part.

Check the docs directory in this repo for guidance on submission and
getting your shim signed.

Here's the template:

*******************************************************************************
### What organization or people are asking to have this signed?
*******************************************************************************
ZeronsoftN Inc

*******************************************************************************
### What product or service is this for?
*******************************************************************************
ZeroUp & ZeroCle

*******************************************************************************
### What's the justification that this really does need to be signed for the whole world to be able to boot it?
*******************************************************************************
ZeroUp is a system recovery solution. Before booting, should be able to enter recovery mode (by grub).

ZeroCle is a disk sanitize solution, booting into Linux is required for sanitize disk.

*******************************************************************************
### Why are you unable to reuse shim from another distro that is already signed?
*******************************************************************************

- We use alpine, but alpine does not sign the kernel. So we will achieve trusted boot by signing that kernel.
- We also generate a single executable grub.efi with the grub-mkstandalone tool with check_signatures enabled to prevent tampering with grub's configuration.
- We will also use systemd-boot. (requires a small linux run with minimal efi file) 

*******************************************************************************
### Who is the primary contact for security updates, etc.?
The security contacts need to be verified before the shim can be accepted. For subsequent requests, contact verification is only necessary if the security contacts or their PGP keys have changed since the last successful verification.

An authorized reviewer will initiate contact verification by sending each security contact a PGP-encrypted email containing random words.
You will be asked to post the contents of these mails in your `shim-review` issue to prove ownership of the email addresses and PGP keys.
*******************************************************************************
- Name: Joseph Lee
- Position: Engineer
- Email address: joseph@zeronsoftn.com
- PGP key fingerprint: 0744F33608FABCE1BD6996964961F2130CDE7CC8

```
-----BEGIN PGP PUBLIC KEY BLOCK-----
Comment: User-ID:	Joseph Lee <joseph@zeronsoftn.com>
Comment: Created:	22. 6. 27. 오후 4:06
Comment: Expires:	27. 6. 27. 오후 12:00
Comment: Type:	3,072-bit RSA (secret key available)
Comment: Usage:	Signing, Encryption, Certifying User-IDs
Comment: Fingerprint:	0744F33608FABCE1BD6996964961F2130CDE7CC8

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
+5Lc2CqeRvQG+pzDfgU6o3TeI9xkBZsgVoc=
=9wL+
-----END PGP PUBLIC KEY BLOCK-----
```

*******************************************************************************
### Who is the secondary contact for security updates, etc.?
*******************************************************************************
- Name: Hyunduk Choi
- Position: Engineer
- Email address: hyunduk.choi@gmail.com
- PGP key fingerprint: 9eb34b7d9c9f81a3e8484ef0229e2b9f84ece2ac

```
-----BEGIN PGP PUBLIC KEY BLOCK-----
Comment: User-ID:	hdchoi <hyunduk.choi@gmail.com>


mQENBF0cTgcBCADBwbBoLNHoIpEjv0NCCENgwqG3z0vE4gmlS1nt+dTZfNNFvto/
aFvYIho0DLjU3r6bqWZ34qbuqLGANx4r1He0swOqRd8qdip6TC3h+f42vXgvWK/E
5EESMk07wLbMKzl8hbU8JtlgZUqVvbQ99sKLIx3rc1ZV0beDNK9PjKgx2zrAU+6U
8FZwyuPnGlPcNelqmMzSqKWkRRjp2M6McxTblye82YgLUFOc92Xkv8Q3v5A1UbUM
dgPajQxyawQmRAY/YjTAn8ijG/wXdSNBAprFkqcLrhPTSSusr+VvDQP3UF+x0MyI
ixD8lx38xnHyZZc45EN1mDu5l5PTQIh7811nABEBAAG0H2hkY2hvaSA8aHl1bmR1
ay5jaG9pQGdtYWlsLmNvbT6JAVQEEwEIAD4WIQSes0t9nJ+Bo+hITvAiniufhOzi
rAUCXRxOBwIbAwUJA8OEqQULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRAiniuf
hOzirC8EB/0T0ML+mKUMK3+53f3UMgdQ8x7013nj4Xcc6TPK2Cv5d8SFbMh4ammJ
/xkP0qYjhlwAHkGM4ynt1W0i7aVQ6H5jXKg5sDGF8QEfoxkDcjKsgl++pvREEnwx
VlvhVbtWsk4X0PhSiICbbva7G0QSFo++m1CfX1ZCeulkRjSe9NEMNuUf593cOjUW
BM05OQFj9vqmlzqnFFE8fekTEeTwN1VyvCWAL43dXLyVxqlslEsi6qvblU7F9Fy5
9UeyWgS0BeHq1VQoYfH0rOY6GbLST1flM1GlmjW2T3Le5wBeTgBcXUAMLEGeyVbv
lrPsqcBoQZPQImEfVAmRXMf9M7gVLCxYuQENBF0cTgcBCADbM/WlMydFoGEZ7VEO
E00+VahAmvUAN2C5Jc5KcLS5SGGchdM3GQMVGZyCtsOLv/aP6QmHj+I+kjkyLGmd
3HafPfv+lYIfqH8m68ofnf9XJMm3slU/f8DEiuqHBn14r+ZjUGiGsd4GfDFf8e03
EqY/y57fLCLSE9GTgbDoHmwToc1POchCYT4Il85GftdvZpKurRZufmZM/5UbDT+y
/VeVpsOW7KUY98BVkIhDxvpQ5N3inqM8uIus4RmYHScAljCkAjuG9NoPKEng1XtR
XghHCRvUP/mXCEA178AgJY2IM+TxtyMWVLRXaxFMoAGYXJppk+XNyZ+02Ttozljd
jhSLABEBAAGJATwEGAEIACYWIQSes0t9nJ+Bo+hITvAiniufhOzirAUCXRxOBwIb
DAUJA8OEqQAKCRAiniufhOzirKMLB/0elTXiJSFbqVa4NewmqIv/mbLtIqO8v73n
qr208speC0Qzg9upVabs2EovpYRY7NdAJCnea5cD4o6WT8OoOOg1DaBVKNkkvnhg
JTVrYGr09dj0g8payL/c+OmYfFWW3cDQ/ik1X5CGISLeKoBWT5vdEo+Q3OJ6zXN6
2vuRBbQB85vGd6cmR1AmhWbN6AzG2XcyfanZFaWXqPr+2sAVOok+6XZk04yqa31u
gC4+uGxoKZ4YiZEZ9lwDkqmurczJhVhEPaL0o5C5/sgR9t5K8SLhePlZOAjAfQoG
GKmKdDXD05I0qOeFZTVWkN39QOqp1ZadzGxXD7hMHaV9Wh9vNcgn
=2En4
-----END PGP PUBLIC KEY BLOCK-----
```


*******************************************************************************
### Were these binaries created from the 15.8 shim release tar?
Please create your shim binaries starting with the 15.8 shim release tar file: https://github.com/rhboot/shim/releases/download/15.8/shim-15.8.tar.bz2

This matches https://github.com/rhboot/shim/releases/tag/15.8 and contains the appropriate gnu-efi source.

*******************************************************************************
Yes

*******************************************************************************
### URL for a repo that contains the exact code which was built to get this binary:
*******************************************************************************

See [Dockerfile](./Dockerfile)

```
SHIM_ARCHIVE_URL=https://github.com/rhboot/shim/releases/download/15.8/shim-15.8.tar.bz2
SHIM_ARCHIVE_FILE=shim-15.8.tar.bz2
SHIM_ARCHIVE_SHA256=a79f0a9b89f3681ab384865b1a46ab3f79d88b11b4ca59aa040ab03fffae80a9
```


*******************************************************************************
### What patches are being applied and why:
*******************************************************************************

None

*******************************************************************************
### Do you have the NX bit set in your shim? If so, is your entire boot stack NX-compatible and what testing have you done to ensure such compatibility?

See https://techcommunity.microsoft.com/t5/hardware-dev-center/nx-exception-for-shim-community/ba-p/3976522 for more details on the signing of shim without NX bit.
*******************************************************************************

No. We operate as a recovery solution as below. For compatibility with the user's PC's existing OS, NX-bit is not activated.

```
Boot --> ZeronsoftN SHIM --> ZeronsoftN GRUB ----> Existing Bootloader (Other vendor's SHIM/GRUB)
                                             \---> Recovery Linux (ZeronsoftN)
```

*******************************************************************************
### If shim is loading GRUB2 bootloader what exact implementation of Secureboot in GRUB2 do you have? (Either Upstream GRUB2 shim_lock verifier or Downstream RHEL/Fedora/Debian/Canonical-like implementation)
*******************************************************************************

We use debian's implementation of GRUB2 - latest from bookworm

```
grub-efi-amd64-bin        2.06-13+deb12u1
```

*******************************************************************************
### If shim is loading GRUB2 bootloader and your previously released shim booted a version of GRUB2 affected by any of the CVEs in the July 2020, the March 2021, the June 7th 2022, the November 15th 2022, or 3rd of October 2023 GRUB2 CVE list, have fixes for all these CVEs been applied?

* 2020 July - BootHole
  * Details: https://lists.gnu.org/archive/html/grub-devel/2020-07/msg00034.html
  * CVE-2020-10713
  * CVE-2020-14308
  * CVE-2020-14309
  * CVE-2020-14310
  * CVE-2020-14311
  * CVE-2020-15705
  * CVE-2020-15706
  * CVE-2020-15707
* March 2021
  * Details: https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html
  * CVE-2020-14372
  * CVE-2020-25632
  * CVE-2020-25647
  * CVE-2020-27749
  * CVE-2020-27779
  * CVE-2021-3418 (if you are shipping the shim_lock module)
  * CVE-2021-20225
  * CVE-2021-20233
* June 2022
  * Details: https://lists.gnu.org/archive/html/grub-devel/2022-06/msg00035.html, SBAT increase to 2
  * CVE-2021-3695
  * CVE-2021-3696
  * CVE-2021-3697
  * CVE-2022-28733
  * CVE-2022-28734
  * CVE-2022-28735
  * CVE-2022-28736
  * CVE-2022-28737
* November 2022
  * Details: https://lists.gnu.org/archive/html/grub-devel/2022-11/msg00059.html, SBAT increase to 3
  * CVE-2022-2601
  * CVE-2022-3775
* October 2023 - NTFS vulnerabilities
  * Details: https://lists.gnu.org/archive/html/grub-devel/2023-10/msg00028.html, SBAT increase to 4
  * CVE-2023-4693
  * CVE-2023-4692
*******************************************************************************

We used `ubuntu's 2.04-1ubuntu26.1` before.
Added old shims and grubs to vendor_dbx.

And the sbat of grub to be currently used is number 4.

```bash
objcopy -j .sbat -O binary /usr/lib/grub/x86_64-efi/monolithic/grubx64.efi /tmp/aa; cat /tmp/aa
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
grub,4,Free Software Foundation,grub,2.06,https://www.gnu.org/software/grub/
grub.debian,4,Debian,grub2,2.06-13+deb12u1,https://tracker.debian.org/pkg/grub2
```

*******************************************************************************
### If shim is loading GRUB2 bootloader, and if these fixes have been applied, is the upstream global SBAT generation in your GRUB2 binary set to 4?
The entry should look similar to: `grub,4,Free Software Foundation,grub,GRUB_UPSTREAM_VERSION,https://www.gnu.org/software/grub/`
*******************************************************************************

Yes.

*******************************************************************************
### Were old shims hashes provided to Microsoft for verification and to be added to future DBX updates?
### Does your new chain of trust disallow booting old GRUB2 builds affected by the CVEs?
*******************************************************************************

We have no shims signed pre-SBAT.

*******************************************************************************
### If your boot chain of trust includes a Linux kernel:
### Is upstream commit [1957a85b0032a81e6482ca4aab883643b8dae06e "efi: Restrict efivar_ssdt_load when the kernel is locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1957a85b0032a81e6482ca4aab883643b8dae06e) applied?
### Is upstream commit [75b0cea7bf307f362057cc778efe89af4c615354 "ACPI: configfs: Disallow loading ACPI tables when locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=75b0cea7bf307f362057cc778efe89af4c615354) applied?
### Is upstream commit [eadb2f47a3ced5c64b23b90fd2a3463f63726066 "lockdown: also lock down previous kgdb use"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=eadb2f47a3ced5c64b23b90fd2a3463f63726066) applied?
*******************************************************************************

Yes. They are all applied from upstream.

6.1.58: https://github.com/zeronsoftn/alpine-pkg-kernel/tree/9283243d5045be9ef362ef4bcfd785bc4ba91ca7

*******************************************************************************
### Do you build your signed kernel with additional local patches? What do they do?
*******************************************************************************

No pacthes.

*******************************************************************************
### Do you use an ephemeral key for signing kernel modules?
### If not, please describe how you ensure that one kernel build does not load modules built for another kernel.
*******************************************************************************

When building the kernel, a ephemeral key is generated and signed.

https://github.com/zeronsoftn/alpine-pkg-kernel/blob/9283243d5045be9ef362ef4bcfd785bc4ba91ca7/lts.x86_64.config#L131

*******************************************************************************
### Do you use an ephemeral key for signing kernel modules?
### If not, please describe how you ensure that one kernel build does not load modules built for another kernel.
*******************************************************************************
[your text here]

*******************************************************************************
### If you use vendor_db functionality of providing multiple certificates and/or hashes please briefly describe your certificate setup.
### If there are allow-listed hashes please provide exact binaries for which hashes are created via file sharing service, available in public with anonymous access for verification.
*******************************************************************************

We don't use vendor_db.

*******************************************************************************
### If you are re-using a previously used (CA) certificate, you will need to add the hashes of the previous GRUB2 binaries exposed to the CVEs to vendor_dbx in shim in order to prevent GRUB2 from being able to chainload those older GRUB2 binaries. If you are changing to a new (CA) certificate, this does not apply.
### Please describe your strategy.
*******************************************************************************

We issued a new certificate. Also added old shims and grubs to vendor_dbx.

*******************************************************************************
### What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as closely as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
### If the shim binaries can't be reproduced using the provided Dockerfile, please explain why that's the case and what the differences would be.
*******************************************************************************

See [Dockerfile](./Dockerfile)

*******************************************************************************
### Which files in this repo are the logs for your build?
This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
*******************************************************************************

See [review/build-log.txt](./review/build-log.txt)

*******************************************************************************
### What changes were made in the distro's secure boot chain since your SHIM was last signed?
For example, signing new kernel's variants, UKI, systemd-boot, new certs, new CA, etc..
*******************************************************************************

- no changed CA
- new certificate
- new kernel
- new shim
- new grub

*******************************************************************************
### What is the SHA256 hash of your final SHIM binary?
*******************************************************************************

```
f6be6f0ab0bfe8896b19785143cc9595b9d8b0f124492537a02034ea3e6a75df  shimaa64.efi
f903dab7a5a95157f9d68c5d8dddfe835b2fa03d9f63797a4b0c464265662429  shimia32.efi
6d16b244f8901cdf3c2abc27172390a3e7bf752bbb096c62b12eac4f3917c8f4  shimx64.efi
```

*******************************************************************************
### How do you manage and protect the keys used in your SHIM?
*******************************************************************************

It is managed through SafeNet's HSM Token.
SafeNet eToken 5110 SC (FIPS 140-2 level 3)

*******************************************************************************
### Do you use EV certificates as embedded certificates in the SHIM?
*******************************************************************************

No

*******************************************************************************
### Do you add a vendor-specific SBAT entry to the SBAT section in each binary that supports SBAT metadata ( GRUB2, fwupd, fwupdate, systemd-boot, systemd-stub, UKI(s), shim + all child shim binaries )?
### Please provide exact SBAT entries for all shim binaries as well as all SBAT binaries that shim will directly boot.
### Where your code is only slightly modified from an upstream vendor's, please also preserve their SBAT entries to simplify revocation.
If you are using a downstream implementation of GRUB2 or systemd-boot (e.g.
from Fedora or Debian), please preserve the SBAT entry from those distributions
and only append your own. More information on how SBAT works can be found
[here](https://github.com/rhboot/shim/blob/main/SBAT.md).
*******************************************************************************

SHIM:
```
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
shim,4,UEFI shim,shim,1,https://github.com/rhboot/shim
shim.zeronsoftn,1,ZeronsoftN,shim,15.8-0zeron1,https://github.com/zeronsoftn/shim-release
```

GRUB:
```
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
grub,4,Free Software Foundation,grub,2.06,https://www.gnu.org/software/grub/
grub.debian,4,Debian,grub2,2.06-13+deb12u1,https://tracker.debian.org/pkg/grub2
```

systemd uefi stub:
```
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
systemd,1,The systemd Developers,systemd,255,https://systemd.io/
systemd.zeronsoftn,1,ZeronsoftN,systemd,255-0zeron1,https://github.com/zeronsoftn/
```

*******************************************************************************
### If shim is loading GRUB2 bootloader, which modules are built into your signed GRUB2 image?
*******************************************************************************

```
all_video ahci reboot halt minicmd help diskfilter acpi ata blocklist boot cat cmp configfile cpuid crypto cryptodisk datetime elf echo exfat ext2 fat gptsync halt hashsum iso9660 ldm linux loadenv ls lspci mdraid1x memdisk msdospart normal ntfs ntfscomp ohci part_gpt part_msdos raid5rec random scsi search search_fs_file search_fs_uuid search_label sleep squash4 tar test time true usb usb_keyboard xfs usbms file pgp verifiers gcry_rsa gcry_dsa gcry_sha256 gcry_sha512 regexp zstd luks2 lvm
```

*******************************************************************************
### If you are using systemd-boot on arm64 or riscv, is the fix for [unverified Devicetree Blob loading](https://github.com/systemd/systemd/security/advisories/GHSA-6m6p-rjcq-334c) included?
*******************************************************************************

255 version is patched.

*******************************************************************************
### What is the origin and full version number of your bootloader (GRUB2 or systemd-boot or other)?
*******************************************************************************

- grub-efi-amd64-bin 2.06-13+deb12u1+deb12u1
- https://packages.debian.org/source/bookworm/grub2
- https://ftp.debian.org/debian/pool/main/g/grub-efi-amd64-signed/grub-efi-amd64-signed_1+2.06+13+deb12u1_amd64.deb

*******************************************************************************
### If your SHIM launches any other components, please provide further details on what is launched.
*******************************************************************************

We use systemd-boot stub to combine kernels and initrds into a single binary.

*******************************************************************************
### If your GRUB2 or systemd-boot launches any other binaries that are not the Linux kernel in SecureBoot mode, please provide further details on what is launched and how it enforces Secureboot lockdown.
*******************************************************************************

We also boot into windows from grub2.
Chainload verifies the digital signature of the windows bootloader.

*******************************************************************************
### How do the launched components prevent execution of unauthenticated code?
*******************************************************************************

**Grub**
Make an image that check_signatures enabled, with grub-mkstandalone.
All files, such as settings, must be signed with the gpg key to be read.

**Kernel**

kernel implemented lockdown.

*******************************************************************************
### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB2)?
*******************************************************************************

No

*******************************************************************************
### What kernel are you using? Which patches does it includes to enforce Secure Boot?
*******************************************************************************

6.1.58: https://github.com/zeronsoftn/alpine-pkg-kernel/tree/9283243d5045be9ef362ef4bcfd785bc4ba91ca7

A lockdown patch has already been applied to this version of Linux.
Also apply patches from https://salsa.debian.org/kernel-team/linux/-/tree/debian/6.1.55-1/debian/patches/features/all/lockdown:
- https://github.com/zeronsoftn/alpine-pkg-kernel/blob/9283243d5045be9ef362ef4bcfd785bc4ba91ca7/0004-arm64-add-kernel-config-option-to-lock-down-when.patch
- https://github.com/zeronsoftn/alpine-pkg-kernel/blob/9283243d5045be9ef362ef4bcfd785bc4ba91ca7/0005-efi-add-an-efi_secure_boot-flag-to-indicate-secure-b.patch
- https://github.com/zeronsoftn/alpine-pkg-kernel/blob/9283243d5045be9ef362ef4bcfd785bc4ba91ca7/0006-efi-lock-down-the-kernel-if-booted-in-secure-boot-mo.patch
- https://github.com/zeronsoftn/alpine-pkg-kernel/blob/9283243d5045be9ef362ef4bcfd785bc4ba91ca7/0007-mtd-disable-slram-and-phram-when-locked-down.patch

*******************************************************************************
### Add any additional information you think we may need to validate this shim.
*******************************************************************************

Build: `docker buildx build --no-cache --output=type=tar,dest=output.tar .`

**How do you prevent modules from a kernel build to be loaded by another kernel?**

