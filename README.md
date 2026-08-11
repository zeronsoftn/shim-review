This repo is for review of requests for signing shim. To create a request for review:

- clone this repo (preferably fork it)
- edit the template below
- add the shim.efi to be signed
- add build logs
- add any additional binaries/certificates/SHA256 hashes that may be needed
- commit all of that
- tag it with a tag of the form "myorg-shim-arch-YYYYMMDD"
- push it to GitHub
- file an issue at https://github.com/rhboot/shim-review/issues with a link to your tag
- approval is ready when the "accepted" label is added to your issue

Note that we really only have experience with using GRUB2 or systemd-boot on Linux, so
asking us to endorse anything else for signing is going to require some convincing on
your part.

As of 27 June 2026, shims sent to Microsoft can only be signed by the Microsoft UEFI CA 2023. It is no longer possible to get your shim signed by the "old" Microsoft Corporation UEFI CA 2011 key. Up-to-date information from Microsoft about Secure Boot can be found here: https://support.microsoft.com/en-US/servicing/os/secure-boot/2026/02/updates-and-announcements

New signing requirements have also taken effect, and are available here: https://techcommunity.microsoft.com/blog/hardware-dev-center/updated-microsoft-uefi-signing-requirements/1062916 Please note that undergoing this shim review exempts you from yearly security audits, as long as your shim only hands off to open source boot loaders.

Hint: check the [docs](./docs/) directory in this repo for guidance on submission and getting your shim signed.

Here's the template:

*******************************************************************************
### What organization or people are asking to have this signed?
*******************************************************************************
Organization name and website:  
ZeronsoftN Inc  
https://www.zeronsoftn.com

*******************************************************************************
### What's the legal data that proves the organization's genuineness?
The reviewers should be able to easily verify, that your organization is a legal entity, to prevent abuse.
Provide the information, which can prove the genuineness with certainty.
*******************************************************************************
Company/tax register entries or equivalent:  
(a link to the organization entry in your jurisdiction's register will do)  

Korea BRN Number: 384-81-00232

The public details of both your organization and the issuer in the EV certificate used for signing .cab files at Microsoft Hardware Dev Center File Signing Services.  
(**not** the CA certificate embedded in your shim binary)

```
Issuer: CN=DigiCert Trusted G4 Code Signing RSA4096 SHA384 2021 CA1, O="DigiCert, Inc.", C=US

Subject: CN=ZeronsoftN Co. LTD, O=ZeronsoftN Co. LTD, L=Gwacheon-si, ST=Gyeonggi-do, C=KR, SERIALNUMBER=110111-5903855, OID.2.5.4.15=Private Organization, OID.1.3.6.1.4.1.311.60.2.1.1=Anyang-si, OID.1.3.6.1.4.1.311.60.2.1.2=Gyeonggi-do, OID.1.3.6.1.4.1.311.60.2.1.3=KR
```

*******************************************************************************
### What product or service is this for?
*******************************************************************************
ZeroUp & ZeroCle

*******************************************************************************
### What's the justification that this really does need to be signed for the whole world to be able to boot it?
*******************************************************************************
ZeroUp is a system recovery solution. Before booting, should be able to enter recovery mode (by grub).

It is also used as Intel vPro's OemPba.efi. It can boot into ZeroUp using Intel vPro's OCR (One Click Recovery) feature.

ZeroCle is a disk sanitize solution, booting into Linux is required for sanitize disk.

*******************************************************************************
### Why are you unable to reuse shim from another distro that is already signed?
*******************************************************************************
- We use alpine, but alpine does not sign the kernel. So we will achieve trusted boot by signing that kernel.
- We also generate a single executable grub.efi with the grub-mkstandalone tool with built-in grub.cfg.
- We also use systemd-boot. (requires a small linux run with minimal efi file)

*******************************************************************************
### Who is the primary contact for security updates, etc.?
The security contacts need to be verified before the shim can be accepted. For subsequent requests, contact verification is only necessary if the security contacts or their PGP keys have changed since the last successful verification.

An authorized reviewer will initiate contact verification by sending each security contact a PGP-encrypted email containing random words.
You will be asked to post the contents of these mails in your `shim-review` issue to prove ownership of the email addresses and PGP keys.
Please upload the PGP keys to a well-known keyserver like keyserver.ubuntu.com and/or include them in the review as an .asc file, and point to them here.

*******************************************************************************
- Name: Joseph Lee
- Position: Engineer
- Email address: joseph@zeronsoftn.com
- PGP key fingerprint: 0744F33608FABCE1BD6996964961F2130CDE7CC8
- File/keyserver location:
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
- PGP key fingerprint: 9EB34B7D9C9F81A3E8484EF0229E2B9F84ECE2AC
- File/keyserver location:
```
-----BEGIN PGP PUBLIC KEY BLOCK-----
Comment: User-ID:	hdchoi <hyunduk.choi@gmail.com>
Comment: Created:	2019-07-03 오후 3:41
Comment: Expires:	2030-01-26 오후 12:00
Comment: Type:	2048-bit RSA (secret key available)
Comment: Usage:	Signing, Certifying User-IDs
Comment: Fingerprint:	9EB34B7D9C9F81A3E8484EF0229E2B9F84ECE2AC


mQENBF0cTgcBCADBwbBoLNHoIpEjv0NCCENgwqG3z0vE4gmlS1nt+dTZfNNFvto/
aFvYIho0DLjU3r6bqWZ34qbuqLGANx4r1He0swOqRd8qdip6TC3h+f42vXgvWK/E
5EESMk07wLbMKzl8hbU8JtlgZUqVvbQ99sKLIx3rc1ZV0beDNK9PjKgx2zrAU+6U
8FZwyuPnGlPcNelqmMzSqKWkRRjp2M6McxTblye82YgLUFOc92Xkv8Q3v5A1UbUM
dgPajQxyawQmRAY/YjTAn8ijG/wXdSNBAprFkqcLrhPTSSusr+VvDQP3UF+x0MyI
ixD8lx38xnHyZZc45EN1mDu5l5PTQIh7811nABEBAAG0H2hkY2hvaSA8aHl1bmR1
ay5jaG9pQGdtYWlsLmNvbT6JAVQEEwEIAD4CGwMFCwkIBwIGFQoJCAsCBBYCAwEC
HgECF4AWIQSes0t9nJ+Bo+hITvAiniufhOzirAUCZlfJIwUJE+CqKQAKCRAiniuf
hOzirGHIB/wItOoPHBhp9UYGyfEi5o8JkFidaxj3ZTTT2H89kbAV4s6kpj+btjiF
574NcVjVwlqTyRMaVwyUS8IoMbdLA75+XGdXPtrDQgxC7xE35e4yBo7uSjsmteV5
oJIylVrTzsRq0zH9CxemWQxAdDvok/PJuuP+s9XOuYV+YtDkRpsoiVA77CilbuCW
pkBkmL8CBKz4dcdehkrJCV2fGwc6H89Z2bcOJhjYaZsSIhubLxSSQZvX4XH8ss95
XR8DeaejmVS/RMGly78XzoTWaKB8dHvXd/j1jLc0M30zLtUJavm648uBlvXDANdj
dZSPQSN+BSx3rvPuhML7jvqjBW+xt5TBuQENBF0cTgcBCADbM/WlMydFoGEZ7VEO
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
=cS/z
-----END PGP PUBLIC KEY BLOCK-----
```

*******************************************************************************
### Were these binaries created from the 16.1 shim release tar?
Please create your shim binaries starting with the 16.1 shim release tar file: https://github.com/rhboot/shim/releases/download/16.1/shim-16.1.tar.bz2

This matches https://github.com/rhboot/shim/releases/tag/16.1 and contains the appropriate gnu-efi source.

Make sure the tarball is correct by verifying your download's checksum
(SHA256, SHA512) with the following ones:

```
46319cd228d8f2c06c744241c0f342412329a7c630436fce7f82cf6936b1d603  shim-16.1.tar.bz2
ca5f80e82f3b80b622028f03ef23105c98ee1b6a25f52a59c823080a3202dd4b9962266489296e99f955eb92e36ce13e0b1d57f688350006bba45f2718f159fb  shim-16.1.tar.bz2
```

Make sure that you've verified that your build process uses that file
as a source of truth (excluding external patches) and its checksum
matches. You can also further validate the release by checking the PGP
signature: there's [a detached
signature](https://github.com/rhboot/shim/releases/download/16.1/shim-16.1.tar.bz2.asc)

The release is signed by the maintainer Peter Jones - his master key
has the fingerprint `B00B48BC731AA8840FED9FB0EED266B70F4FEF10` and the
signing sub-key in the signature here has the fingerprint
`02093E0D19DDE0F7DFFBB53C1FD3F540256A1372`. A copy of his public key
is included here for reference:
[pjones.asc](https://github.com/rhboot/shim-review/blob/main/pjones.asc)

Once you're sure that the tarball you are using is correct and
authentic, please confirm this here with a simple *yes*.

A short guide on verifying public keys and signatures should be available in the [docs](./docs/) directory.
*******************************************************************************

yes. you can see [Dockerfile](./Dockerfile).

*******************************************************************************
### URL for a repo that contains the exact code which was built to result in your binary:
Hint: If you attach all the patches and modifications that are being used to your application, you can point to the URL of your application here (*`https://github.com/YOUR_ORGANIZATION/shim-review`*).

You can also point to your custom git servers, where the code is hosted.
*******************************************************************************
See [Dockerfile](./Dockerfile)

*******************************************************************************
### What patches are being applied and why:
Mention all the external patches and build process modifications, which are used during your building process, that make your shim binary be the exact one that you posted as part of this application.
*******************************************************************************

N/A

*******************************************************************************
### Do you have the NX bit set in your shim? If so, is your entire boot stack NX-compatible and what testing have you done to ensure such compatibility?

See https://techcommunity.microsoft.com/t5/hardware-dev-center/nx-exception-for-shim-community/ba-p/3976522 for more details on the signing of shim without NX bit.
*******************************************************************************

NX compat bit is not set.

*******************************************************************************
### What exact implementation of Secure Boot in GRUB2 do you have? (Either Upstream GRUB2 shim_lock verifier or Downstream RHEL/Fedora/Debian/Canonical-like implementation)
Skip this, if you're not using GRUB2.
*******************************************************************************
We use Ubuntu's (Canonical-like downstream) implementation of GRUB2.

```
grub-efi-amd64-bin          2.12-1ubuntu7.3
```

*******************************************************************************
### Do you have fixes for all the following GRUB2 CVEs applied?
**Skip this, if you're not using GRUB2, otherwise make sure these are present and confirm with _yes_.**

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
* February 2025
  * Details: https://lists.gnu.org/archive/html/grub-devel/2025-02/msg00024.html, SBAT increase to 5
  * CVE-2024-45774
  * CVE-2024-45775
  * CVE-2024-45776
  * CVE-2024-45777
  * CVE-2024-45778
  * CVE-2024-45779
  * CVE-2024-45780
  * CVE-2024-45781
  * CVE-2024-45782
  * CVE-2024-45783
  * CVE-2025-0622
  * CVE-2025-0624
  * CVE-2025-0677
  * CVE-2025-0678
  * CVE-2025-0684
  * CVE-2025-0685
  * CVE-2025-0686
  * CVE-2025-0689
  * CVE-2025-0690
  * CVE-2025-1118
  * CVE-2025-1125
*******************************************************************************

Yes.

We use `grub-efi-amd64-bin 2.12-1ubuntu7.3` (source package `grub2-unsigned`, Ubuntu 24.04 noble),
which is the latest version published for noble.

- The 2020 (BootHole), March 2021, June 2022, November 2022 and October 2023 (NTFS, CVE-2023-4692 /
  CVE-2023-4693) fixes are all part of the upstream GRUB 2.12 release this package is built from.
- The February 2025 batch (CVE-2024-45774 ... CVE-2024-45783, CVE-2025-0622, CVE-2025-0624,
  CVE-2025-0677, CVE-2025-0678, CVE-2025-0684, CVE-2025-0685, CVE-2025-0686, CVE-2025-0689,
  CVE-2025-0690, CVE-2025-1118, CVE-2025-1125) was applied in `2.12-1ubuntu7.2`, which also bumped
  the SBAT level to `grub,5`.
- `2.12-1ubuntu7.3` only drops the *non-CVE* NTFS hardening patches from that series
  (`fs/ntfs: Implement attribute verification` and friends), which caused boot regressions on NTFS
  systems; no CVE fix listed above is removed by it.

Changelog: https://changelogs.ubuntu.com/changelogs/pool/main/g/grub2/grub2_2.12-1ubuntu7.3/changelog

*******************************************************************************
### If shim is loading GRUB2 bootloader, and if these fixes have been applied, is the upstream global SBAT generation in your GRUB2 binary set to 5?
Skip this, if you're not using GRUB2, otherwise do you have an entry in your GRUB2 binary similar to:  
`grub,5,Free Software Foundation,grub,GRUB_UPSTREAM_VERSION,https://www.gnu.org/software/grub/`?
*******************************************************************************
yes

```
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
grub,5,Free Software Foundation,grub,2.12,https://www.gnu.org/software/grub/
grub.ubuntu,2,Ubuntu,grub2,2.12-1ubuntu7.3,https://www.ubuntu.com/
grub.peimage,2,Canonical,grub2,2.12-1ubuntu7.3,https://salsa.debian.org/grub-team/grub/-/blob/master/debian/patches/secure-boot/efi-use-peimage-shim.patch
```

*******************************************************************************
### Were old shims hashes provided to Microsoft for verification and to be added to future DBX updates?
### Does your new chain of trust disallow booting old GRUB2 builds affected by the CVEs?
If you had no previous signed shim, say so here. Otherwise a simple _yes_ will do.
*******************************************************************************

No. The signed shim-15.8 hash has not been submitted to Microsoft for DBX inclusion. We rely on SBAT-based revocation for this purpose.

*******************************************************************************
### If your boot chain of trust includes a Linux kernel:
### Is upstream commit [1957a85b0032a81e6482ca4aab883643b8dae06e "efi: Restrict efivar_ssdt_load when the kernel is locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1957a85b0032a81e6482ca4aab883643b8dae06e) applied?
### Is upstream commit [75b0cea7bf307f362057cc778efe89af4c615354 "ACPI: configfs: Disallow loading ACPI tables when locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=75b0cea7bf307f362057cc778efe89af4c615354) applied?
### Is upstream commit [eadb2f47a3ced5c64b23b90fd2a3463f63726066 "lockdown: also lock down previous kgdb use"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=eadb2f47a3ced5c64b23b90fd2a3463f63726066) applied?
Hint: upstream kernels should have all these applied, but if you ship your own heavily-modified older kernel version, that is being maintained separately from upstream, this may not be the case.  
If you are shipping an older kernel, double-check your sources; maybe you do not have all the patches, but ship a configuration, that does not expose the issue(s).
*******************************************************************************

Yes. They are all applied from upstream.

6.18.42: https://github.com/zeronsoftn/alpine-packages/blob/67485318457a4bce8efca6788476b8df7f74fad4/zeron/linux-lts/APKBUILD

*******************************************************************************
### How does your signed kernel enforce lockdown when your system runs with Secure Boot enabled?
Hint: If it does not, we are not likely to sign your shim.
*******************************************************************************

```
CONFIG_LOCK_DOWN_IN_EFI_SECURE_BOOT=y
```

https://github.com/zeronsoftn/alpine-packages/blob/67485318457a4bce8efca6788476b8df7f74fad4/zeron/linux-lts/lts.x86_64.config#L3224

*******************************************************************************
### Do you build your signed kernel with additional local patches? What do they do?
*******************************************************************************

https://github.com/zeronsoftn/alpine-packages/tree/67485318457a4bce8efca6788476b8df7f74fad4/zeron/linux-lts

Only Alpine's upstream patches have been applied.

- 0001-powerpc-boot-wrapper-Add-z-notext-flag-for-ppc64le.patch
- 0001-x86-CPU-AMD-avoid-printing-reset-reasons-on-Xen-domU.patch
- 0002-x86-Compress-vmlinux-with-zstd-19-instead-of-22.patch
- 0003-kexec-add-kexec_load_disabled-boot-option.patch
- 0004-objtool-respect-AWK-setting.patch
Kernel 6.12.48 (#1)
- 0005-powerpc-config-defang-gcc-check-for-stack-protector-.patch

*******************************************************************************
### Do you use an ephemeral key for signing kernel modules?
### If not, please describe how you ensure that one kernel build does not load modules built for another kernel.
*******************************************************************************
Yes. An ephemeral key is generated at kernel build time and used to sign the modules.

https://github.com/zeronsoftn/alpine-packages/blob/67485318457a4bce8efca6788476b8df7f74fad4/zeron/linux-lts/lts.x86_64.config#L131

*******************************************************************************
### If you use vendor_db functionality of providing multiple certificates and/or hashes please briefly describe your certificate setup.
### If there are allow-listed hashes please provide exact binaries for which hashes are created via file sharing service, available in public with anonymous access for verification.
*******************************************************************************
We don't use vendor_db.

*******************************************************************************
### If you are re-using the CA certificate from your last shim binary, you will need to add the hashes of the previous GRUB2 binaries exposed to the CVEs mentioned earlier to vendor_dbx in shim. Please describe your strategy.
This ensures that your new shim+GRUB2 can no longer chainload those older GRUB2 binaries with issues.

If this is your first application or you're using a new CA certificate, please say so here.
*******************************************************************************

We do not reuse certificates used in previous shim binaries because the RSA-2048 included in previously submitted shims will not be safe from 2030 onwards.

As RSA-2048 no longer provides an adequate security margin for a certificate that is embedded in a shim and has to stay valid for many years, we replaced it with a new certificate using a 4096-bit RSA key.

This shim embeds a new signing certificate:

```
Subject: C = KR, O = ZeronsoftN Co. LTD, OU = Secure Boot, CN = ZeronsoftN Secure Boot Signing (2026)
Issuer:  CN = ZeronsoftN CA, O = ZeronsoftN, C = KR
Serial:  0973E631C6ECA442
Valid:   Aug 10 08:52:11 2026 GMT - Aug  7 08:52:10 2036 GMT
Key:     RSA 4096 bit (the previous certificate was RSA 2048 bit)
```

Because the previous certificate is no longer embedded, binaries signed with it (including our
previous GRUB2 builds) can no longer be verified by this shim at all.

Also, the previous certificate was added to vendor_dbx.

The contents can be dumped with [helper/show-vendor-dbx.sh](./helper/show-vendor-dbx.sh):

```
SignatureType=c1c41626-504c-4092-aca9-41f936934328 SignatureListSize=220 SignatureSize=48 entries=4
  owner=605dab50-e046-4300-abb6-3dd810dd8b23 sha256=9812e22f2813f109fe515c4ebf94d760516c62290da2e1046ca9fd040109c73d
  owner=605dab50-e046-4300-abb6-3dd810dd8b23 sha256=b7de13f6145076843e477ab1920da19bb00d885add4cc62793fda9e77d259e5f
  owner=605dab50-e046-4300-abb6-3dd810dd8b23 sha256=2ef2db26c881d02493b5f392e967a37e2ab6b418121bbb43ebb977aaa25abc35
  owner=605dab50-e046-4300-abb6-3dd810dd8b23 sha256=161ea03ea4a9bb64ada20e63fa3b4948e4dd445a7f60fdaf959b1ea20e376a3c
SignatureType=a5c059a1-94e4-4aa7-87b5-ab155c2bf072 SignatureListSize=1280 SignatureSize=1252 entries=1
  owner=605dab50-e046-4300-abb6-3dd810dd8b23 x509 (1236 bytes, fingerprint=5aee5d34285bf6aee0c4a9d6b9061fb47fdbc07b9c3a7f75f6ea996126ff16a3) subject=CN = ZeronsoftN Secure Boot Signing (2022), OU = Secure Boot, O = ZeronsoftN, C = KR
```

*******************************************************************************
### Is the Dockerfile in your repository the recipe for reproducing the building of your shim binary?
A reviewer should always be able to run `docker build .` to get the exact binary you attached in your application.

Hint: Prefer using *frozen* packages for your toolchain, since an update to GCC, binutils, gnu-efi may result in building a shim binary with a different checksum.

If your shim binaries can't be reproduced using the provided Dockerfile, please explain why that's the case, what the differences would be and what build environment (OS and toolchain) is being used to reproduce this build? In this case please write a detailed guide, how to setup this build environment from scratch.
*******************************************************************************
Yes. See [Dockerfile](./Dockerfile)


```sh 
$ docker buildx build --no-cache --output=type=tar,dest=output.tar .
$ tar -xf output.tar
$ sha256sum shim*.efi
```

*******************************************************************************
### Which files in this repo are the logs for your build?
This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
*******************************************************************************
See [review/build-log.txt](./review/build-log.txt)

*******************************************************************************
### What changes were made in the distro's secure boot chain since your SHIM was last signed?
For example, signing new kernel's variants, UKI, systemd-boot, new certs, new CA, etc..

Skip this, if this is your first application for having shim signed.
*******************************************************************************

- no changed CA
- new signing certificate embedded in shim: `CN = ZeronsoftN Secure Boot Signing (2026)` (moved from RSA-2048 to RSA-4096 for a stronger security margin).
- new kernel
- new shim
- new grub

*******************************************************************************
### What is the SHA256 hash of your final shim binary?
*******************************************************************************

```
f6bb2ee504a7322ae0c31315c375f2378d215da30ced027f018dda57dda39dfc  shimaa64.efi
33f49deb1314587f2b8d3a5e3a5ed89d4e0da76822ad0b5a14c0793437ea928b  shimia32.efi
ab0b5103136379e5569440a7d6ab609300e4e33f0e32b2733de6a7998c0ad698  shimx64.efi
```

*******************************************************************************
### How do you manage and protect the keys used in your shim?
Describe the security strategy that is used for key protection. This can range from using hardware tokens like HSMs or Smartcards, air-gapped vaults, physical safes to other good practices.
*******************************************************************************
It is managed through SafeNet's HSM Token.
SafeNet eToken 5110 SC (FIPS 140-2 level 3)

*******************************************************************************
### Do you use EV certificates as embedded certificates in the shim?
A _yes_ or _no_ will do. There's no penalty for the latter.
*******************************************************************************
No

*******************************************************************************
### Are you embedding a CA certificate in your shim?
A _yes_ or _no_ will do. There's no penalty for the latter. However,
if _yes_: does that certificate include the X509v3 Basic Constraints
to say that it is a CA? See the [docs](./docs/) for more guidance
about this.
*******************************************************************************

No. The CA certificate is not embedded.

The embedded certificate is a leaf code signing certificate with
`X509v3 Basic Constraints: critical, CA:FALSE`.

*******************************************************************************
### Do you add a vendor-specific SBAT entry to the SBAT section in each binary that supports SBAT metadata ( GRUB2, fwupd, fwupdate, systemd-boot, systemd-stub, shim + all child shim binaries )?
### Please provide the exact SBAT entries for all binaries you are booting directly through shim.
Hint: The history of SBAT and more information on how it works can be found [here](https://github.com/rhboot/shim/blob/main/SBAT.md). That document is large, so for just some examples check out [SBAT.example.md](https://github.com/rhboot/shim/blob/main/SBAT.example.md)

If you are using a downstream implementation of GRUB2 (e.g. from Fedora or Debian), make sure you have their SBAT entries preserved and that you **append** your own (don't replace theirs) to simplify revocation.

**Remember to post the entries of all the binaries. Apart from your bootloader, you may also be shipping e.g. a firmware updater, which will also have these.**

Hint: run `objcopy --dump-section .sbat=/dev/stdout YOUR_EFI_BINARY` to get these entries. Paste them here. Preferably surround each listing with three backticks (\`\`\`), so they render well.
*******************************************************************************

SHIM:
```
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
shim,4,UEFI shim,shim,1,https://github.com/rhboot/shim
shim.zeronsoftn,1,ZeronsoftN,shim,16.1,https://github.com/zeronsoftn/shim-release
```

GRUB:
```
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
grub,5,Free Software Foundation,grub,2.12,https://www.gnu.org/software/grub/
grub.ubuntu,2,Ubuntu,grub2,2.12-1ubuntu7.3,https://www.ubuntu.com/
grub.peimage,2,Canonical,grub2,2.12-1ubuntu7.3,https://salsa.debian.org/grub-team/grub/-/blob/master/debian/patches/secure-boot/efi-use-peimage-shim.patch
grub.zeronsoftn,1,ZeronsoftN,grub2,2.12-1ubuntu7,https://github.com/zeronsoftn/shim-release
```

systemd uefi stub:
```
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
systemd-stub,1,The systemd Developers,systemd,255,https://systemd.io/
systemd-stub.ubuntu,1,Ubuntu,systemd,255.4-1ubuntu8.16,https://bugs.launchpad.net/ubuntu/
systemd-boot.zeronsoftn,1,ZeronsoftN,systemd,255-0zeron1,https://github.com/zeronsoftn/shim-release
```

*******************************************************************************
### If shim is loading GRUB2 bootloader, which modules are built into your signed GRUB2 image?
Skip this, if you're not using GRUB2.

Hint: this is about those modules that are in the binary itself, not the `.mod` files in your filesystem.
*******************************************************************************

```
boot cat chain cmp_test configfile cpuid echo exfat ext2 f2fs fat file gcry_sha256 hashsum http iso9660 linux loadenv loopback ls lvm memdisk minicmd msdospart nativedisk net normal ntfs ntfscomp part_gpt part_msdos peimage play probe reboot regexp search search_fs_file search_fs_uuid sleep smbios squash4 tar test tftp tpm true usb usbms zstd
```

*******************************************************************************
### If you are using systemd-boot on arm64 or riscv, is the fix for [unverified Devicetree Blob loading](https://github.com/systemd/systemd/security/advisories/GHSA-6m6p-rjcq-334c) included?
*******************************************************************************

255 version is patched.

*******************************************************************************
### What is the origin and full version number of your bootloader (GRUB2 or systemd-boot or other)?
*******************************************************************************
Our GRUB2 and systemd-boot binaries originate from Ubuntu packages.

- grub-efi-amd64-bin 2.12-1ubuntu7.3
- systemd-boot-efi 255.4-1ubuntu8.16

*******************************************************************************
### If your shim launches any other components apart from your bootloader, please provide further details on what is launched.
Hint: The most common case here will be a firmware updater like fwupd.
*******************************************************************************
None

*******************************************************************************
### If your GRUB2 or systemd-boot launches any other binaries that are not the Linux kernel in SecureBoot mode, please provide further details on what is launched and how it enforces Secureboot lockdown.
Skip this, if you're not using GRUB2 or systemd-boot.
*******************************************************************************
We also boot into Windows from GRUB2.
Chainload verifies the digital signature of the Windows bootloader.

*******************************************************************************
### How do the launched components prevent execution of unauthenticated code?
Summarize in one or two sentences, how your secure bootchain works on higher level.
*******************************************************************************
**Grub**

Use grub-mkstandalone to create an image containing the configuration.

**Kernel**

The kernel implements lockdown, so unauthenticated code cannot be loaded once Secure Boot is on.

*******************************************************************************
### Does your shim load any loaders that support loading unsigned kernels (e.g. certain GRUB2 configurations)?
*******************************************************************************
No

*******************************************************************************
### What kernel are you using? Which patches and configuration does it include to enforce Secure Boot?
*******************************************************************************

6.18.42: https://github.com/zeronsoftn/alpine-packages/blob/67485318457a4bce8efca6788476b8df7f74fad4/zeron/linux-lts/APKBUILD

*******************************************************************************
### What contributions have you made to help us review the applications of other applicants?
The reviewing process is meant to be a peer-review effort and the best way to have your application reviewed faster is to help with reviewing others. We are in most cases volunteers working on this venue in our free time, rather than being employed and paid to review the applications during our business hours. 

A reasonable timeframe of waiting for a review can reach 2-3 months. Helping us is the best way to shorten this period. The more help we get, the faster and the smoother things will go.

For newcomers, the applications labeled as [*easy to review*](https://github.com/rhboot/shim-review/issues?q=is%3Aopen+is%3Aissue+label%3A%22easy+to+review%22) are recommended to start the contribution process.
*******************************************************************************

- https://github.com/rhboot/shim-review/issues/577

*******************************************************************************
### Add any additional information you think we may need to validate this shim signing application.
*******************************************************************************

