Make sure you have provided the following information:

 - [x] link to your code branch cloned from rhboot/shim-review in the form user/repo@tag  
https://github.com/Rohde-Schwarz/shim-review/tree/rohdeschwarz-shim-x64-20210401
 - [x] completed README.md file with the necessary information  
https://github.com/Rohde-Schwarz/shim-review/blob/rohdeschwarz-shim-x64-20210401/README.md
 - [x] shim.efi to be signed  
https://github.com/Rohde-Schwarz/shim-review/blob/rohdeschwarz-shim-x64-20210401/shimx64.efi
 - [x] public portion of your certificate(s) embedded in shim (the file passed to VENDOR_CERT_FILE)  
https://github.com/Rohde-Schwarz/shim-review/blob/rohdeschwarz-shim-x64-20210401/rs-uefi-cs.der
 - [x] binaries, for which hashes are added do vendor_db ( if you use vendor_db and have hashes allow-listed )  
No vendor_db is used.
 - [x] any extra patches to shim via your own git tree or as files  
https://github.com/Rohde-Schwarz/shim-review/blob/rohdeschwarz-shim-x64-20210401/patches/msabi.patch 
 - [x] any extra patches to grub via your own git tree or as files  
N/A 
 - [x] build logs  
https://github.com/Rohde-Schwarz/shim-review/blob/rohdeschwarz-shim-x64-20210401/build.log


###### What organization or people are asking to have this signed:
`Rohde & Schwarz Cybersecurity GmbH`

###### What product or service is this for:
`Trusted Disk full-disk encryption`

###### Please create your shim binaries starting with the 15.4 shim release tar file:
###### https://github.com/rhboot/shim/releases/download/15.4/shim-15.4.tar.bz2
###### This matches https://github.com/rhboot/shim/releases/tag/15.4 and contains
###### the appropriate gnu-efi source.
###### Please confirm this as the origin your shim.
Yes, we are using `https://github.com/rhboot/shim/releases/download/15.4/shim-15.4.tar.bz2`

###### What's the justification that this really does need to be signed for the whole world to be able to boot it:
`Trusted Disk provides full-disk encryption for internal and external storage devices and protects data from unauthorized access. With a signed SHIM bootloader we are able to use the secure boot feature to ensure that each of the files in the boot chain are unmodified.`

###### How do you manage and protect the keys used in your SHIM?
`The private key is stored on hardware token with restricted access.`

###### Do you use EV certificates as embedded certificates in the SHIM?
`No.`

###### If you use new vendor_db functionality, are any hashes allow-listed, and if yes: for what binaries ?
`No vendor_db is used.`

###### Is kernel upstream commit 75b0cea7bf307f362057cc778efe89af4c615354 present in your kernel, if you boot chain includes a Linux kernel ?
`No Linux kernel is used.`

###### if SHIM is loading GRUB2 bootloader, are CVEs CVE-2020-14372,
###### CVE-2020-25632, CVE-2020-25647, CVE-2020-27749, CVE-2020-27779,
###### CVE-2021-20225, CVE-2021-20233, CVE-2020-10713, CVE-2020-14308,
###### CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705,
###### ( July 2020 grub2 CVE list + March 2021 grub2 CVE list )
###### and if you are shipping the shim_lock module CVE-2021-3418
###### fixed ?
`No GRUB bootloader is used.`

###### "Please specifically confirm that you add a vendor specific SBAT entry for SBAT header in each binary that supports SBAT metadata
###### ( grub2, fwupd, fwupdate, shim + all child shim binaries )" to shim review doc ?
###### Please provide exact SBAT entries for all SBAT binaries you are booting or planning to boot directly through shim

**shim**

    sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
    shim,1,UEFI shim,shim,1,https://github.com/rhboot/shim
    shim.rscs,1,Rohde & Schwarz Cybersecurity GmbH,shim,15.4,https://www.rohde-schwarz.com/cybersecurity

**trusted disk**

    sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
    tdisk.rscs,1,Rohde & Schwarz Cybersecurity GmbH,tdisk,1,https://www.rohde-schwarz.com/cybersecurity

##### Were your old SHIM hashes provided to Microsoft ?
`This is our first SHIM submission.`

##### Did you change your certificate strategy, so that affected by CVE-2020-14372, CVE-2020-25632, CVE-2020-25647, CVE-2020-27749,
##### CVE-2020-27779, CVE-2021-20225, CVE-2021-20233, CVE-2020-10713,
##### CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705 ( July 2020 grub2 CVE list + March 2021 grub2 CVE list )
##### grub2 bootloaders can not be verified ?
`No GRUB bootloader is used.`

##### What exact implementation of Secureboot in grub2 ( if this is your bootloader ) you have ?
##### * Upstream grub2 shim_lock verifier or * Downstream RHEL/Fedora/Debian/Canonical like implementation ?
`No GRUB bootloader is used.`

###### What is the origin and full version number of your bootloader (GRUB or other)?
`No GRUB bootloader is used.`

###### If your SHIM launches any other components, please provide further details on what is launched
`The SHIM launches our pre-boot authentication component that decrypts the system and boots a Windows operating system.`

###### If your GRUB2 launches any other binaries that are not Linux kernel in SecureBoot mode,
###### please provide further details on what is launched and how it enforces Secureboot lockdown
`No GRUB bootloader is used.`

###### If you are re-using a previously used (CA) certificate, you
###### will need to add the hashes of the previous GRUB2 binaries
###### exposed to the CVEs to vendor_dbx in shim in order to prevent
###### GRUB2 from being able to chainload those older GRUB2 binaries. If
###### you are changing to a new (CA) certificate, this does not
###### apply. Please describe your strategy.
`This is our first SHIM submission.`

###### How do the launched components prevent execution of unauthenticated code?
`The integrity of each file in our boot chain is verified by checking the validity of the digital signature when using the LoadImage/StartImage functions.`

###### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB)?
`No.`

###### What kernel are you using? Which patches does it includes to enforce Secure Boot?
`No Linux kernel is used.`

###### What changes were made since your SHIM was last signed?
`This is our first SHIM submission.`

###### What is the SHA256 hash of your final SHIM binary?
`AEA8A013DC0E974AC62C444F9AA4ABF6373FC8D83C7BBF97F661F8D3CDA92BF6`
