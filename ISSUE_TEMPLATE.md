Confirm the following are included in your repo, checking each box:

 - [x] completed README.md file with the necessary information
 - [x] shim.efi to be signed
 - [x] public portion of your certificate(s) embedded in shim (the file passed to VENDOR_CERT_FILE)
 - [x] binaries, for which hashes are added to vendor_db ( if you use vendor_db and have hashes allow-listed )
 - [x] any extra patches to shim via your own git tree or as files
 - [x] any extra patches to grub via your own git tree or as files
 - [x] build logs
 - [x] a Dockerfile to reproduce the build of the provided shim EFI binaries

*******************************************************************************
### What is the link to your tag in a repo cloned from rhboot/shim-review?
*******************************************************************************
https://github.com/Rohde-Schwarz/shim-review/tree/rohdeschwarz-shim-x64-20240219

*******************************************************************************
### What is the SHA256 hash of your final SHIM binary?
*******************************************************************************
`6A887C457F51CEE59855C4B98834E9EAB273A6400AB9137BCD0A99DBAE1AAA60`

*******************************************************************************
### What is the link to your previous shim review request (if any, otherwise N/A)?
*******************************************************************************
[Shim 15.6](https://github.com/rhboot/shim-review/issues/257)
[Shim 15.4](https://github.com/rhboot/shim-review/issues/191)
