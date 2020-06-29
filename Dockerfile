FROM ubuntu:focal

RUN apt-get update
RUN apt-get install -y build-essential gnu-efi git bsdmainutils

WORKDIR /build
RUN git clone --single-branch --branch rohdeschwarz-shim-x64-20200629 https://github.com/Rohde-Schwarz/shim-review
RUN git clone --single-branch --branch 15 https://github.com/rhboot/shim.git

WORKDIR /build/shim
RUN ln -s /usr/lib /usr/lib64/gnuefi
RUN cp /build/shim-review/patches/mokmanager-use-comparemem.patch .
RUN git apply mokmanager-use-comparemem.patch
RUN make 'DEFAULT_LOADER=\\\\EFI\\\\RSCS\\\\RSCSBOOT.EFI' VENDOR_CERT_FILE=/build/shim-review/rs-uefi-cs.der

WORKDIR /
RUN hexdump -Cv /build/shim-review/shimx64.efi > shim-orig.hex
RUN hexdump -Cv /build/shim/shimx64.efi > shim-build.hex
RUN diff -u shim-orig.hex shim-build.hex
RUN sha256sum /build/shim-review/shimx64.efi
RUN sha256sum /build/shim/shimx64.efi
