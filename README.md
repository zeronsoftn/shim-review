This repo is for review of requests for signing shim.  To create a request for review:

- clone this repo
- edit the template below
- add the shim.efi to be signed
- add build logs
- add any additional binaries/certificates/SHA256 hashes that may be needed
- commit all of that
- tag it with a tag of the form "myorg-shim-arch-YYYYMMDD"
- push that to github
- file an issue at https://github.com/rhboot/shim-review/issues with a link to your branch
- approval is ready when you have accepted tag

Note that we really only have experience with using GRUB2 on Linux, so asking
us to endorse anything else for signing is going to require some convincing on
your part.

Here's the template:

-------------------------------------------------------------------------------
What organization or people are asking to have this signed:
-------------------------------------------------------------------------------
```
ZeronsoftN Inc
```

-------------------------------------------------------------------------------
What product or service is this for:
-------------------------------------------------------------------------------
```
ZeroUp & ZeroMon
```

-------------------------------------------------------------------------------
What's the justification that this really does need to be signed for the whole world to be able to boot it:
-------------------------------------------------------------------------------
```
ZeroUp is a system recovery solution. Before booting, should be able to enter recovery mode (by grub).

ZeroCle is a disk sanitize solution, booting into Linux is required for sanitize disk.
```

-------------------------------------------------------------------------------
Who is the primary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: Joseph Lee
- Position: Engineer
- Email address: joseph@zeronsoftn.com
- PGP key, signed by the other security contacts, and preferably also with signatures that are reasonably well known in the Linux community:
```
-----BEGIN PGP PUBLIC KEY BLOCK-----
Comment: User-ID:	Joseph Lee <joseph@zeronsoftn.com>
Comment: Type:	2,048-bit RSA (secret key available)
Comment: Usage:	Signing, Encryption, Certifying User-IDs
Comment: Fingerprint:	957FF3F04DAD4079A8B4F96BDCDF4A772D412DC1


mQENBF25PV4BCADKd6m70p3qkBcKCRf9yz13HwWuljTHEuPrbVk7pL3XkSRYL7ck
iE/7uvoroIbytwvzozuyq1deHYNsRt70OnclRS8Wg9VWbVDz7m9B9/xD08Fbk8Dm
bNqro3IGs+obHcTEmPxD1Ll/lS95YtQ0HpozR1QjnQPDz6xXgCGeGEdno0mteGCt
nQSjJwdZbwS4sKXlx9Y1QUj9uLJtMKWNWjK3aqqPxtZpkOtGwpIpRB8OYmBwFxca
evpcUmkZR3ugGjbH5j7E4SxLqXqUFiYE3PdOW5VcaBmnrrOFWemyGE73YeX+XS5+
fpgHr93mXHUA1fZPRhtbG7Ajs6++38r5M1QrABEBAAG0Ikpvc2VwaCBMZWUgPGpv
c2VwaEB6ZXJvbnNvZnRuLmNvbT6JAVQEEwEIAD4CGwMFCwkIBwIGFQoJCAsCBBYC
AwECHgECF4AWIQSVf/PwTa1Aeai0+Wvc30p3LUEtwQUCYFqA2gUJBaVUEAAKCRDc
30p3LUEtwf1FB/9Aw4KDddoliPeCip18RUvHnA7oWPFG5dykeR1OUPAx/0tdj97+
J4w03OAzjy/6zumIAHlRnSQQSAEKoToKK3xnRrH3MUXRfPgyb/4IX8x9sErBd5aH
h5hACQSHusvYnAZie2qLH18jgIq5zLszqsNRgmv6DnalFZWu4FOnYqktz9VW3aQb
nD9pzR6LXSJYCjVjOh6L9Vx5IoEH5zkVGh0vJ9HyTeaVnfkiXXWMuw7sGzok8Q8y
V1QGm1YGzhY4TyDVkBM80Vly5xiVoE384wbjGI1t9vDKQ/n+5CKperggeNYaLUwj
5x6qoGQHVPdn6drCannvm2PPdEeYvmde7YseuQENBF25PV4BCAC9whOXeb/W7Zqp
CbOYIIXrU84I4edMhl52UI3q0Z4uJ5dsjJo3DVPtJVtUJascuU0k0k+8EKv5rhNO
aK3gNPUZKUmlqT/jEIQUYy8kQLvlxMTXD0xAUaoGx3PaCkXrJ6QDB01ia05Tu8dz
a/YYS4CcxuEcyMP5/u7PIW/ucTkgiaiU7HPcmXVI4Xl1+DjS37GJKfHw6AL3JMGG
p7vfk8fzdtmPj1ivJ3RO7sgZToVBxYn1W+nvAdUzRH6b+mC3FPEoENfYG7rAkAxM
o+McDU13w4j0KpNtYnd2fvZhhNdO7p/pGkoYfG8kbFmFf3GQ+fJ/gw+KnONexwrz
pa00HX1PABEBAAGJATwEGAEIACYWIQSVf/PwTa1Aeai0+Wvc30p3LUEtwQUCXbk9
XgIbDAUJA8N30gAKCRDc30p3LUEtwf+lB/4tVj5rhAPnExZlC3j+Irl0KXUOvaan
BsSWpcMbo+qbAOC38vOhsz6APDUY+JU0WaU5/2hDhrmstW3j5oAwcMfs7d/e12qZ
AtERPKK25H2aOJQ8OJ8tqmJnFe/skacnzqJueIKG/tlnZ37Nw+ODX5rmKZ7EJPqK
kDkQ9FosRAQ4AxXMRqzDdAsm7ymWP2OmpCANzkxxhRuInS8zIrxOUfY1dvumBiwJ
maTWk3eoYD2YAIw16wEhkw1SsKimNuhqWPjGT3mvjUQdO1aK8qWwl5//C68PaAWg
jjS5kpNQN6SPGgYtmM7NYG/+aC0O6Pwv9NufJOSFKZlYNHrvAbHOM87q
=sqBQ
-----END PGP PUBLIC KEY BLOCK-----
```


-------------------------------------------------------------------------------
Who is the secondary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: 
- Position: Engineer
- Email address: 
- PGP key, signed by the other security contacts, and preferably also with signatures that are reasonably well known in the Linux community:
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
Please create your shim binaries starting with the 15.4 shim release tar file:
https://github.com/rhboot/shim/releases/download/15.4/shim-15.4.tar.bz2

This matches https://github.com/rhboot/shim/releases/tag/15.4 and contains
the appropriate gnu-efi source.
-------------------------------------------------------------------------------
```
YES. I used "https://github.com/rhboot/shim/releases/download/15.4/shim-15.4.tar.bz2"
```

-------------------------------------------------------------------------------
URL for a repo that contains the exact code which was built to get this binary:
-------------------------------------------------------------------------------
```
https://github.com/rhboot/shim/releases/download/15.4/shim-15.4.tar.bz2
```

-------------------------------------------------------------------------------
What patches are being applied and why:
-------------------------------------------------------------------------------
```
None
```

-------------------------------------------------------------------------------
If bootloader, shim loading is, GRUB2: is CVE-2020-14372, CVE-2020-25632,
 CVE-2020-25647, CVE-2020-27749, CVE-2020-27779, CVE-2021-20225, CVE-2021-20233,
 CVE-2020-10713, CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311,
 CVE-2020-15705, and if you are shipping the shim_lock module CVE-2021-3418
-------------------------------------------------------------------------------
```
We will use Ubuntu's `debian/2.04-1ubuntu26.9`.
https://github.com/zeronsoftn/grub2/tree/zeron-2.04 (Exactly matches Ubuntu's debian/2.04-1ubuntu26.9 commit)
```

-------------------------------------------------------------------------------
What exact implementation of Secureboot in GRUB2 ( if this is your bootloader ) you have ?
* Upstream GRUB2 shim_lock verifier or * Downstream RHEL/Fedora/Debian/Canonical like implementation ?
-------------------------------------------------------------------------------
```
We use Canonical's implementation as described above.
```

-------------------------------------------------------------------------------
If bootloader, shim loading is, GRUB2, and previous shims were trusting affected
by CVE-2020-14372, CVE-2020-25632, CVE-2020-25647, CVE-2020-27749,
  CVE-2020-27779, CVE-2021-20225, CVE-2021-20233, CVE-2020-10713,
  CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705,
  and if you were shipping the shim_lock module CVE-2021-3418
  ( July 2020 grub2 CVE list + March 2021 grub2 CVE list )
  grub2:
* were old shims hashes provided to Microsoft for verification
  and to be added to future DBX update ?
* Does your new chain of trust disallow booting old, affected by CVE-2020-14372,
  CVE-2020-25632, CVE-2020-25647, CVE-2020-27749,
  CVE-2020-27779, CVE-2021-20225, CVE-2021-20233, CVE-2020-10713,
  CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705,
  and if you were shipping the shim_lock module CVE-2021-3418
  ( July 2020 grub2 CVE list + March 2021 grub2 CVE list )
  grub2 builds ?
-------------------------------------------------------------------------------
```
We haven't used shims before.
```

-------------------------------------------------------------------------------
If your boot chain of trust includes linux kernel, is
"efi: Restrict efivar_ssdt_load when the kernel is locked down"
upstream commit 1957a85b0032a81e6482ca4aab883643b8dae06e applied ?
Is "ACPI: configfs: Disallow loading ACPI tables when locked down"

upstream commit 75b0cea7bf307f362057cc778efe89af4c615354 applied ?
-------------------------------------------------------------------------------
```
Yes, we use alpine kernel-lts (5.10.25).
```

-------------------------------------------------------------------------------
If you use vendor_db functionality of providing multiple certificates and/or
hashes please briefly describe your certificate setup. If there are allow-listed hashes
please provide exact binaries for which hashes are created via file sharing service,
available in public with anonymous access for verification
-------------------------------------------------------------------------------
```
None.
```



-------------------------------------------------------------------------------
If you are re-using a previously used (CA) certificate, you will need
to add the hashes of the previous GRUB2 binaries to vendor_dbx in shim
in order to prevent GRUB2 from being able to chainload those older GRUB2
binaries. If you are changing to a new (CA) certificate, this does not
apply. Please describe your strategy.
-------------------------------------------------------------------------------
```
We will change the certificate in case of problems in the future.
```



-------------------------------------------------------------------------------
What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as close as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
If possible, provide a Dockerfile that rebuilds the shim.
-------------------------------------------------------------------------------
```
All package versions are displayed in the build log. It also has a Dockerfile.
```



-------------------------------------------------------------------------------
Which files in this repo are the logs for your build?   This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
-------------------------------------------------------------------------------
[build-log.txt](./build-log.txt)


-------------------------------------------------------------------------------
Add any additional information you think we may need to validate this shim
-------------------------------------------------------------------------------

Builder for docker : https://github.com/zeronsoftn/shim-builder/tree/zeron/15.4-1 (commit id : dd158d28952e3ce6b2d7bf81ecb4fc103cf3b463)

