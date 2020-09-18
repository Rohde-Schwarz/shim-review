Make sure you have provided the following information:

 - [x] link to your code branch cloned from rhboot/shim-review in the form user/repo@tag  
https://github.com/Rohde-Schwarz/shim-review/tree/rohdeschwarz-shim-x64-20200629
 - [x] completed README.md file with the necessary information  
https://github.com/Rohde-Schwarz/shim-review/blob/rohdeschwarz-shim-x64-20200629/README.md
 - [x] shim.efi to be signed  
https://github.com/Rohde-Schwarz/shim-review/blob/rohdeschwarz-shim-x64-20200629/shimx64.efi
 - [x] public portion of your certificate(s) embedded in shim (the file passed to VENDOR_CERT_FILE)  
https://github.com/Rohde-Schwarz/shim-review/blob/rohdeschwarz-shim-x64-20200629/rs-uefi-cs.der
 - [ ] binaries, for which hashes are added do vendor_db ( if you use vendor_db and have hashes whitelisted )
 - [x] any extra patches to shim via your own git tree or as files  
https://github.com/Rohde-Schwarz/shim-review/blob/rohdeschwarz-shim-x64-20200629/patches/mokmanager-use-comparemem.patch
 - [x] any extra patches to grub via your own git tree or as files  
N/A 
 - [x] build logs  
https://github.com/Rohde-Schwarz/shim-review/blob/rohdeschwarz-shim-x64-20200629/build.log


###### What organization or people are asking to have this signed:
`Rohde & Schwarz Cybersecurity GmbH`

###### What product or service is this for:
`Trusted Disk full-disk encryption`

###### What is the origin and full version number of your shim?
`https://github.com/rhboot/shim/releases/tag/15`

###### What's the justification that this really does need to be signed for the whole world to be able to boot it:
`Trusted Disk provides full-disk encryption for internal and external storage devices and protects data from unauthorized access. With a signed SHIM bootloader we are able to use the secure boot feature to ensure that each of the files in the boot chain are unmodified.`

###### How do you manage and protect the keys used in your SHIM?
`The private key is stored on hardware token with restricted access.`

###### Do you use EV certificates as embedded certificates in the SHIM?
`No.`

###### If you use new vendor_db functionality, are any hashes whitelisted, and if yes: for what binaries ?
`[your text here]`

###### Is kernel upstream commit 75b0cea7bf307f362057cc778efe89af4c615354 present in your kernel, if you boot chain includes a linux kernel ?
`[your text here]`

###### if SHIM is loading grub2 bootloader, is CVE CVE-2020-10713 fixed ?
`[your text here]`

##### Were your old SHIM hashes provided to Microsoft ?
`[your text here]`

##### Did you change your certificate strategy, so that affected by CVE CVE-2020-10713 grub2 bootloaders can not be verified ?
`[your text here]`

###### What is the origin and full version number of your bootloader (GRUB or other)?
`No GRUB bootloader is used.`

###### If your SHIM launches any other components, please provide further details on what is launched
`The SHIM launches our pre-boot authentication component that decrypts the system and boots a Windows operating system.`

###### How do the launched components prevent execution of unauthenticated code?
`The integrity of each file in our boot chain is verified by checking the validity of the digital signature when using the LoadImage/StartImage functions.`

###### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB)?
`No.`

###### What kernel are you using? Which patches does it includes to enforce Secure Boot?
`No Linux kernel is used.`

###### What changes were made since your SHIM was last signed?
`-`

###### What is the hash of your final SHIM binary?
`CF32043988BF7FCBB04B772C034B0B0D099CB25144C0B9C9370D01140F392F60`
