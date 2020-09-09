This repo is for review of requests for signing shim.  To create a request for review:

- clone this repo
- edit the template below
- add the shim.efi to be signed
- add build logs
- commit all of that
- tag it with a tag of the form "myorg-shim-arch-YYYYMMDD"
- push that to github
- file an issue at https://github.com/rhboot/shim-review/issues with a link to your branch

Note that we really only have experience with using grub2 on Linux, so asking
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
ZeroUp & ZeroMon

-------------------------------------------------------------------------------
What's the justification that this really does need to be signed for the whole world to be able to boot it:
-------------------------------------------------------------------------------
ZeroUp is a system recovery solution. Before booting, should be able to enter recovery mode with keyboard input.

Among the features of ZeroMon, booting into Linux is required for safe disk deletion.

-------------------------------------------------------------------------------
Who is the primary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: Joseph Lee

- Position: Engineer

- Email address: joseph@zeronsoftn.com

- PGP key, signed by the other security contacts, and preferably also with signatures that are reasonably well known in the linux community:

  ```
  -----BEGIN PGP PUBLIC KEY BLOCK-----
  Comment: User-ID:	Joseph Lee <joseph@zeronsoftn.com>
  
  
  mQENBF25PV4BCADKd6m70p3qkBcKCRf9yz13HwWuljTHEuPrbVk7pL3XkSRYL7ck
  iE/7uvoroIbytwvzozuyq1deHYNsRt70OnclRS8Wg9VWbVDz7m9B9/xD08Fbk8Dm
  bNqro3IGs+obHcTEmPxD1Ll/lS95YtQ0HpozR1QjnQPDz6xXgCGeGEdno0mteGCt
  nQSjJwdZbwS4sKXlx9Y1QUj9uLJtMKWNWjK3aqqPxtZpkOtGwpIpRB8OYmBwFxca
  evpcUmkZR3ugGjbH5j7E4SxLqXqUFiYE3PdOW5VcaBmnrrOFWemyGE73YeX+XS5+
  fpgHr93mXHUA1fZPRhtbG7Ajs6++38r5M1QrABEBAAG0Ikpvc2VwaCBMZWUgPGpv
  c2VwaEB6ZXJvbnNvZnRuLmNvbT6JAVQEEwEIAD4WIQSVf/PwTa1Aeai0+Wvc30p3
  LUEtwQUCXbk9XgIbAwUJA8N30gULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRDc
  30p3LUEtwTVaB/4x2bYDC0rMJ33ze3/BCqPZ8npvMwo/Pm+A/ZeloyHE4xDh6o/Y
  VyIcP6KID6jQLgvWc37AlKMWYqwnCdY3KYeV2+ir9ytdl2Y/B7eW86HPoWE9DWy2
  xspMHO3PNhqusznd5lTC5Q5I8HJtQqpHjUeiuYxpJ35r6U4Obi6ghnlj40+1GpvH
  Y+Tt4Tc9LX2CAkz54mNXtgDkVh6xiV9aSd0O1cLCvBhiHCLsL5S6eW8lOGqcZB17
  pE7JV+lu5XQwnZcjM9QVmCpELFvitiaemigMv2sEi369K8ACH1GnCyTcrv2uts04
  sZVXbAxuQO/doXiGSY79u/SxJLqRJ8w3KZ/6uQENBF25PV4BCAC9whOXeb/W7Zqp
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
  =h23L
  -----END PGP PUBLIC KEY BLOCK-----
  ```

  

-------------------------------------------------------------------------------
Who is the secondary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: Hyunduk choi

- Position: Engineer

- Email address: hyunduk.choi@gmail.com

- PGP key, signed by the other security contacts, and preferably also with signatures that are reasonably well known in the linux community:

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
What upstream shim tag is this starting from:
-------------------------------------------------------------------------------
```
15 + commits up to a4a1fbe with added patches
```



-------------------------------------------------------------------------------
URL for a repo that contains the exact code which was built to get this binary:
-------------------------------------------------------------------------------
```
https://github.com/zeronsoftn/shim/tree/zeron/15+1552672080.a4a1fbe-1
```



-------------------------------------------------------------------------------
What patches are being applied and why:
-------------------------------------------------------------------------------

* Fix-OBJ_create-to-tolerate-a-NULL-sn-and-ln.patch:
  Fix NULL pointer dereference when calling OBJ_create() that leads to an exception error on arm64. (LP: #1811901)
* MokManager-avoid-unaligned.patch:
  Fix compilation with GCC9: avoid -Werror=address-of-packed-member errors in MokManager.
* tpm-correctness-1.patch
* tpm-correctness-2.patch:
  fix issues in TPM calls to ensure the measurements are consistent with what is entered in the TPM event log.
* tpm-correctness-3.patch:
  Don't log duplicate identical TPM events.
* MokManager-hidpi-support.patch:
  Do a little bit more to try to get a more usable screen resolution for MokManager when running on HiDPI screens; by trying to detect such cases and switching to mode 0.
* fix-path-checks.patch:
  Cherry-pick upstream fix for regression in loading fwupd, or anything else specified as an argument (LP: #1864223)
* uname.patch:
  Refer https://salsa.debian.org/efi-team/shim/-/blob/debian/15+1533136590.3beb971-10/debian/patches/uname.patch
* zeronsoftn/patches/Hook-exit-when-shim_lock-protocol-installed.patch:
  Cherry-pick upstream https://github.com/rhboot/shim/commit/06c92591e9420bdc290abf49072991b96fa467ef

-------------------------------------------------------------------------------
What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as close as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
-------------------------------------------------------------------------------
* Ubuntu 20.04
* binutils-x86-64-linux-gnu : 2.34-6ubuntu1
* gcc : 9.3.0-1ubuntu2
* libgcc-9-dev : 9.3.0-10ubuntu2
* gnu-efi : 3.0.9-1



**To build:**

```bash
## Install git docker

# git clone -b "zeron/15+1552672080.a4a1fbe-1" https://github.com/zeronsoftn/shim-builder.git
# cd shim-builder
# ./build-all.sh
```



-------------------------------------------------------------------------------
Which files in this repo are the logs for your build?   This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
-------------------------------------------------------------------------------
Patched repostiory: https://github.com/zeronsoftn/shim/tree/zeron/15+1552672080.a4a1fbe-1

* [review-request/build-log.txt](review-request/build-log.txt)

-------------------------------------------------------------------------------
Add any additional information you think we may need to validate this shim
-------------------------------------------------------------------------------
Nothing
