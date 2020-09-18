This repo is for review of requests for signing shim.  To create a request for review:

- clone this repo
- edit the template below
- add the shim.efi to be signed
- add build logs
- add any additional binaries/certificates/hashes that may be needed
- commit all of that
- tag it with a tag of the form "myorg-shim-arch-YYYYMMDD"
- push that to github
- file an issue at https://github.com/rhboot/shim-review/issues with a link to your branch
- approval is ready when you have accepted tag

Note that we really only have experience with using grub2 on Linux, so asking
us to endorse anything else for signing is going to require some convincing on
your part.

Here's the template:

-------------------------------------------------------------------------------
What organization or people are asking to have this signed:
-------------------------------------------------------------------------------
Rohde & Schwarz Cybersecurity GmbH

-------------------------------------------------------------------------------
What product or service is this for:
-------------------------------------------------------------------------------
Trusted Disk full-disk encryption

-------------------------------------------------------------------------------
What's the justification that this really does need to be signed for the whole world to be able to boot it:
-------------------------------------------------------------------------------
Trusted Disk provides full-disk encryption for internal and external storage devices and protects data from unauthorized access. With a signed SHIM bootloader we are able to use the secure boot feature to ensure that each of the files in the boot chain are unmodified.

-------------------------------------------------------------------------------
Who is the primary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: Clemens Schulz
- Position: Director Desktop Security
- Email address: Clemens.Schulz@rohde-schwarz.com
- PGP key: https://github.com/Rohde-Schwarz/shim-review/blob/master/keys/schulz.pub

-------------------------------------------------------------------------------
Who is the secondary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: Daniel Neus
- Position: Team Coordinator Trusted Disk
- Email address: Daniel.Neus@rohde-schwarz.com
- PGP key: https://github.com/Rohde-Schwarz/shim-review/blob/master/keys/neus.pub

-------------------------------------------------------------------------------
What upstream shim tag is this starting from:
-------------------------------------------------------------------------------
https://github.com/rhboot/shim/releases/tag/15

-------------------------------------------------------------------------------
URL for a repo that contains the exact code which was built to get this binary:
-------------------------------------------------------------------------------
https://github.com/rhboot/shim/releases/tag/15

-------------------------------------------------------------------------------
What patches are being applied and why:
-------------------------------------------------------------------------------
  * mokmanager-use-comparemem.patch: Fix the errors from gcc9 '-Werror=address-of-packed-member'

-------------------------------------------------------------------------------
If bootloader, shim loading is, grub2: is CVE-2020-10713 fixed ?
-------------------------------------------------------------------------------
[your text here]

-------------------------------------------------------------------------------
If bootloader, shim loading is, grub2, and previous shims were trusting affected
by CVE-2020-10713 grub2:
* were old shims hashes provided to Microsoft for verification
  and to be added to future DBX update ?
* Does your new chain of trust disallow booting old, affected by CVE-2020-10713,
  grub2 builds ?
-------------------------------------------------------------------------------
[your text here]

-------------------------------------------------------------------------------
If your boot chain of trust includes linux kernel, is
"efi: Restrict efivar_ssdt_load when the kernel is locked down"
upstream commit 1957a85b0032a81e6482ca4aab883643b8dae06e applied ?
Is "ACPI: configfs: Disallow loading ACPI tables when locked down"
upstream commit 75b0cea7bf307f362057cc778efe89af4c615354 applied ?
-------------------------------------------------------------------------------
[your text here]


-------------------------------------------------------------------------------
If you use vendor_db functionality of providing multiple certificates and/or
hashes please briefly describe your certificate setup. If there are whitelisted hashes
please provide exact binaries for which hashes are created via file sharing service,
available in public with anonymous access for verification
-------------------------------------------------------------------------------
[your text here]

-------------------------------------------------------------------------------
What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as close as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries. Include a Dockerfile to build it unless you have very good reasons it's not possible.
-------------------------------------------------------------------------------
Please use the included Dockerfile to build and verify our shim bootloader.

-------------------------------------------------------------------------------
Which files in this repo are the logs for your build?   This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
-------------------------------------------------------------------------------
https://github.com/Rohde-Schwarz/shim-review/blob/rohdeschwarz-shim-x64-20200629/build.log

-------------------------------------------------------------------------------
Add any additional information you think we may need to validate this shim
-------------------------------------------------------------------------------
According to an email from Derek Granito (Derek.Granito@microsoft.com), we submit our signing request to both the SHIM review board and through the Microsoft signing portal.
