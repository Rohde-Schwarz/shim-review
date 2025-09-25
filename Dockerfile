FROM ubuntu:noble

COPY . /build/shim-review

RUN apt-get update
RUN apt-get install -y build-essential bsdmainutils wget dos2unix

WORKDIR /build
RUN wget https://github.com/rhboot/shim/releases/download/16.1/shim-16.1.tar.bz2
RUN tar xjf shim-16.1.tar.bz2
RUN patch -p1 < /build/shim-review/patches/disable-all-load-options.patch
COPY sbat.rscs.csv /build/shim-16.1/data

WORKDIR /build/shim-16.1
RUN make 'DEFAULT_LOADER=\\EFI\\RSCS\\RSCSBOOT.EFI' VENDOR_CERT_FILE=/build/shim-review/rscs_uefi_codesign_key_2025.crt POST_PROCESS_PE_FLAGS=-nx DISABLE_ALL_LOAD_OPTIONS=1

WORKDIR /
RUN hexdump -Cv /build/shim-review/shimx64.efi > shim-orig.hex
RUN hexdump -Cv /build/shim-16.1/shimx64.efi > shim-build.hex
RUN diff -u shim-orig.hex shim-build.hex
RUN sha256sum /build/shim-review/shimx64.efi
RUN sha256sum /build/shim-16.1/shimx64.efi
