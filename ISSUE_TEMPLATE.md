Confirm the following are included in your repo, checking each box:

 - [x] completed README.md file with the necessary information  
 https://github.com/Rohde-Schwarz/shim-review/blob/rohdeschwarz-shim-x64-20220630/README.md
 - [x] shim.efi to be signed  
 https://github.com/Rohde-Schwarz/shim-review/blob/rohdeschwarz-shim-x64-20220630/shimx64.efi  
 - [x] public portion of your certificate(s) embedded in shim (the file passed to VENDOR_CERT_FILE)  
 https://github.com/Rohde-Schwarz/shim-review/blob/rohdeschwarz-shim-x64-20220630/rs-uefi-cs.der
 - [x] binaries, for which hashes are added to vendor_db ( if you use vendor_db and have hashes allow-listed )  
 N/A
 - [x] any extra patches to shim via your own git tree or as files  
https://github.com/Rohde-Schwarz/shim-review/blob/rohdeschwarz-shim-x64-20220630/patches/msabi.patch  
https://github.com/Rohde-Schwarz/shim-review/blob/rohdeschwarz-shim-x64-20220630/patches/bypass_bootoptions.patch 
 - [x] any extra patches to grub via your own git tree or as files  
 N/A 
 - [x] build logs  
https://github.com/Rohde-Schwarz/shim-review/blob/rohdeschwarz-shim-x64-20220630/build.log
 - [x] a Dockerfile to reproduce the build of the provided shim EFI binaries  
https://github.com/Rohde-Schwarz/shim-review/blob/rohdeschwarz-shim-x64-20220630/Dockerfile

-------------------------------------------------------------------------------
### What is the link to your tag in a repo cloned from rhboot/shim-review?
-------------------------------------------------------------------------------
`https://github.com/Rohde-Schwarz/shim-review/tree/rohdeschwarz-shim-x64-20220630`

-------------------------------------------------------------------------------
### What is the SHA256 hash of your final SHIM binary?
-------------------------------------------------------------------------------
`2F0FAA6451D33E05FB12CD43EBA618563C40EA5CF531ABD5AB7CC74F53132FBB`
