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

Note that we really only have experience with using GRUB2 on Linux, so asking
us to endorse anything else for signing is going to require some convincing on
your part.

Here's the template:

-------------------------------------------------------------------------------
### What organization or people are asking to have this signed?
-------------------------------------------------------------------------------

```
ZeronsoftN Inc
```

-------------------------------------------------------------------------------
### What product or service is this for?
-------------------------------------------------------------------------------

```
ZeroUp & ZeroCle
```

-------------------------------------------------------------------------------
### What's the justification that this really does need to be signed for the whole world to be able to boot it?
-------------------------------------------------------------------------------

```
ZeroUp is a system recovery solution. Before booting, should be able to enter recovery mode (by grub).

ZeroCle is a disk sanitize solution, booting into Linux is required for sanitize disk.
```

-------------------------------------------------------------------------------
### Who is the primary contact for security updates, etc.?
-------------------------------------------------------------------------------
- Name: Joseph Lee
- Position: Engineer
- Email address: joseph@zeronsoftn.com
- PGP key fingerprint: 0744F33608FABCE1BD6996964961F2130CDE7CC8

(Key should be signed by the other security contacts, pushed to a keyserver
like keyserver.ubuntu.com, and preferably have signatures that are reasonably
well known in the Linux community.)

```
-----BEGIN PGP PUBLIC KEY BLOCK-----
Comment: User-ID:	Joseph Lee <joseph@zeronsoftn.com>
Comment: Created:	2022-06-27 오후 4:06
Comment: Expires:	2027-06-27 오후 12:00
Comment: Type:	3,072-bit RSA (secret key available)
Comment: Usage:	Signing, 암호화, Certifying User-IDs
Comment: 지문:	0744F33608FABCE1BD6996964961F2130CDE7CC8


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
+5Lc2CqeRvQG+pzDfgU6o3TeI9xkBZsgVoc=
=9wL+
-----END PGP PUBLIC KEY BLOCK-----
```

-------------------------------------------------------------------------------
### Who is the secondary contact for security updates, etc.?
-------------------------------------------------------------------------------
- Name: Hyunduk Choi
- Position: Engineer
- Email address: hyunduk.choi@gmail.com
- PGP key fingerprint: 9eb34b7d9c9f81a3e8484ef0229e2b9f84ece2ac

(Key should be signed by the other security contacts, pushed to a keyserver
like keyserver.ubuntu.com, and preferably have signatures that are reasonably
well known in the Linux community.)

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

-------------------------------------------------------------------------------
### Were these binaries created from the 15.6 shim release tar?
Please create your shim binaries starting with the 15.6 shim release tar file: https://github.com/rhboot/shim/releases/download/15.6/shim-15.6.tar.bz2

This matches https://github.com/rhboot/shim/releases/tag/15.6 and contains the appropriate gnu-efi source.

-------------------------------------------------------------------------------

```
Yes
```

-------------------------------------------------------------------------------
### URL for a repo that contains the exact code which was built to get this binary:
-------------------------------------------------------------------------------

```
https://github.com/rhboot/shim/releases/download/15.6/shim-15.6.tar.bz2
SHA 256 : eab91644a3efe91a666399f5d8eb3eed0e04d04f79d4b6c0b278ef7747a239a5
```

-------------------------------------------------------------------------------
### What patches are being applied and why:
-------------------------------------------------------------------------------

```
None
```

-------------------------------------------------------------------------------
### If shim is loading GRUB2 bootloader what exact implementation of Secureboot in GRUB2 do you have? (Either Upstream GRUB2 shim_lock verifier or Downstream RHEL/Fedora/Debian/Canonical-like implementation)
-------------------------------------------------------------------------------

```
We will use Ubuntu's `debian/2.04-1ubuntu26.9`.
https://github.com/zeronsoftn/grub2/tree/zeron-2.04 (Exactly matches Ubuntu's debian/2.04-1ubuntu26.9 commit)
```

-------------------------------------------------------------------------------
### If shim is loading GRUB2 bootloader and your previously released shim booted a version of grub affected by any of the CVEs in the July 2020 grub2 CVE list, the March 2021 grub2 CVE list, or the June 7th 2022 grub2 CVE list:
* CVE-2020-14372
* CVE-2020-25632
* CVE-2020-25647
* CVE-2020-27749
* CVE-2020-27779
* CVE-2021-20225
* CVE-2021-20233
* CVE-2020-10713
* CVE-2020-14308
* CVE-2020-14309
* CVE-2020-14310
* CVE-2020-14311
* CVE-2020-15705
* CVE-2021-3418 (if you are shipping the shim_lock module)

* CVE-2021-3695
* CVE-2021-3696
* CVE-2021-3697
* CVE-2022-28733
* CVE-2022-28734
* CVE-2022-28735
* CVE-2022-28736
* CVE-2022-28737

### Were old shims hashes provided to Microsoft for verification and to be added to future DBX updates?
### Does your new chain of trust disallow booting old GRUB2 builds affected by the CVEs?
-------------------------------------------------------------------------------

```
Not applicable
```

-------------------------------------------------------------------------------
### If your boot chain of trust includes a Linux kernel:
### Is upstream commit [1957a85b0032a81e6482ca4aab883643b8dae06e "efi: Restrict efivar_ssdt_load when the kernel is locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1957a85b0032a81e6482ca4aab883643b8dae06e) applied?
### Is upstream commit [75b0cea7bf307f362057cc778efe89af4c615354 "ACPI: configfs: Disallow loading ACPI tables when locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=75b0cea7bf307f362057cc778efe89af4c615354) applied?
### Is upstream commit [eadb2f47a3ced5c64b23b90fd2a3463f63726066 "lockdown: also lock down previous kgdb use"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=eadb2f47a3ced5c64b23b90fd2a3463f63726066) applied?

-------------------------------------------------------------------------------

```
Yes, we use 5.15.41 kernel with eadb2f47a3ced5c64b23b90fd2a3463f63726066.
https://github.com/zeronsoftn/alpine-pkg-kernel/tree/a1854010b5ccd0cee64cb949cb649824abd1c648
```

-------------------------------------------------------------------------------
### If you use vendor_db functionality of providing multiple certificates and/or hashes please briefly describe your certificate setup.
### If there are allow-listed hashes please provide exact binaries for which hashes are created via file sharing service, available in public with anonymous access for verification.
-------------------------------------------------------------------------------

```
Not applicable
```

-------------------------------------------------------------------------------
### If you are re-using a previously used (CA) certificate, you will need to add the hashes of the previous GRUB2 binaries exposed to the CVEs to vendor_dbx in shim in order to prevent GRUB2 from being able to chainload those older GRUB2 binaries. If you are changing to a new (CA) certificate, this does not apply.
### Please describe your strategy.
-------------------------------------------------------------------------------

```
We will change the certificate in case of problems in the future.
```

-------------------------------------------------------------------------------
### What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as closely as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
### If the shim binaries can't be reproduced using the provided Dockerfile, please explain why that's the case and what the differences would be.
-------------------------------------------------------------------------------

```
All package versions are displayed in the build log. It also has a Dockerfile.
```

-------------------------------------------------------------------------------
### Which files in this repo are the logs for your build?
This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.

-------------------------------------------------------------------------------
[your text here]

-------------------------------------------------------------------------------
### What changes were made since your SHIM was last signed?
-------------------------------------------------------------------------------

```
15.4 -> 15.6
```

-------------------------------------------------------------------------------
### What is the SHA256 hash of your final SHIM binary?
-------------------------------------------------------------------------------

```
685d25649e4f7ef6f39d7a56352c0ffec34d4bae0099ac0e9f6a6951d040d96c  shimaa64.efi
d0d86645c6f2cb10f1de5cf346693b60038cf5efa687ad66846a2a4a307de773  shimia32.efi
f5ecfb00e100eb90be0fe8cee458909edc2907b77d39cefc4cde608d4e2a255e  shimx64.efi
```

-------------------------------------------------------------------------------
### How do you manage and protect the keys used in your SHIM?
-------------------------------------------------------------------------------

```
It is managed through SafeNet's HSM Token.
SafeNet eToken 5110 SC (FIPS 140-2 level 3)
```


-------------------------------------------------------------------------------
### Do you use EV certificates as embedded certificates in the SHIM?
-------------------------------------------------------------------------------

```
No
```

-------------------------------------------------------------------------------
### Do you add a vendor-specific SBAT entry to the SBAT section in each binary that supports SBAT metadata ( grub2, fwupd, fwupdate, shim + all child shim binaries )?
### Please provide exact SBAT entries for all SBAT binaries you are booting or planning to boot directly through shim.
### Where your code is only slightly modified from an upstream vendor's, please also preserve their SBAT entries to simplify revocation.
-------------------------------------------------------------------------------

**SHIM:**
```
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
shim,1,UEFI shim,shim,1,https://github.com/rhboot/shim
shim.zeronsoftn,1,ZeronsoftN,shim,15.6,https://github.com/zeronsoftn/shim-release
```

**GRUB:**
```
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
grub,1,Free Software Foundation,grub,2.04,https://www.gnu.org/software/grub/
grub.zeronsoftn,1,ZeronsoftN,grub2,2.04-1zeron02,https://github.com/zeronsoftn/grub2
```

-------------------------------------------------------------------------------
### Which modules are built into your signed grub image?
-------------------------------------------------------------------------------

```
ahci reboot halt minicmd help diskfilter acpi ata blocklist boot cat cmp configfile cpuid crypto cryptodisk datetime elf echo exfat ext2 fat gptsync halt hashsum iso9660 ldm linux loadenv ls lspci mdraid1x memdisk msdospart normal ntfs ntfscomp ohci part_gpt part_msdos raid5rec random scsi search search_fs_file search_fs_uuid search_label sleep squash4 tar test time true usb usb_keyboard xfs usbms file pgp verifiers gcry_rsa gcry_dsa gcry_sha256 gcry_sha512 regexp
```

-------------------------------------------------------------------------------
### What is the origin and full version number of your bootloader (GRUB or other)?
-------------------------------------------------------------------------------

```
2.04-1zeron02 (https://github.com/zeronsoftn/grub2/tree/zeron/2.04-1zeron02)
(Exactly matches Ubuntu's 2.04-1ubuntu45 commit)
```

-------------------------------------------------------------------------------
### If your SHIM launches any other components, please provide further details on what is launched.
-------------------------------------------------------------------------------

```
Not applicable
```

-------------------------------------------------------------------------------
### If your GRUB2 launches any other binaries that are not the Linux kernel in SecureBoot mode, please provide further details on what is launched and how it enforces Secureboot lockdown.
-------------------------------------------------------------------------------

```
Not applicable
```

-------------------------------------------------------------------------------
### How do the launched components prevent execution of unauthenticated code?
-------------------------------------------------------------------------------

```
Make an image that check_signatures enabled, with grub-mkstandalone.
All files, such as settings, must be signed with the gpg key to be read.
Also, only kernels signed through Secure Boot will work.
```

-------------------------------------------------------------------------------
### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB)?
-------------------------------------------------------------------------------

```
No
```

-------------------------------------------------------------------------------
### What kernel are you using? Which patches does it includes to enforce Secure Boot?
-------------------------------------------------------------------------------

```
we use 5.15.41 kernel with eadb2f47a3ced5c64b23b90fd2a3463f63726066.
https://github.com/zeronsoftn/alpine-pkg-kernel/tree/a1854010b5ccd0cee64cb949cb649824abd1c648
```


-------------------------------------------------------------------------------
### Add any additional information you think we may need to validate this shim.
-------------------------------------------------------------------------------

Build log reproduced from github workflow:

https://github.com/zeronsoftn/shim-review/actions/runs/2567350764


