FROM ubuntu:jammy

COPY . /build/shim-review

RUN apt-get update
RUN apt-get install -y build-essential bsdmainutils wget dos2unix

WORKDIR /build
RUN wget https://github.com/rhboot/shim/releases/download/15.8/shim-15.8.tar.bz2
RUN tar xjf shim-15.8.tar.bz2
RUN patch -p1 < /build/shim-review/patches/msabi.patch
RUN patch -p1 < /build/shim-review/patches/bypass_bootoptions.patch
COPY sbat.rscs.csv /build/shim-15.8/data

WORKDIR /build/shim-15.8
RUN make 'DEFAULT_LOADER=\\EFI\\RSCS\\RSCSBOOT.EFI' VENDOR_CERT_FILE=/build/shim-review/rs-uefi-cs.der

WORKDIR /
RUN hexdump -Cv /build/shim-review/shimx64.efi > shim-orig.hex
RUN hexdump -Cv /build/shim-15.8/shimx64.efi > shim-build.hex
RUN diff -u shim-orig.hex shim-build.hex
RUN sha256sum /build/shim-review/shimx64.efi
RUN sha256sum /build/shim-15.8/shimx64.efi
