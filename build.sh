#!/bin/bash

SOURCES="./src"
KERNEL_SOURCE="./cloned-kernel"
cd $KERNEL_SOURCE
make -j4
KERNEL_IMAGE="./cloned-kernel/arch/x86/boot/bzImage"
cd ..
mkdir -p build
cd build
gcc -c -Os -fno-ident -fno-asynchronous-unwind-tables -fno-stack-protector -fomit-frame-pointer -o shell.o ../$SOURCES/Shell.c
as ../$SOURCES/Sys.s -o sys.o
ld shell.o sys.o -o init -T ../$SOURCES/custom.ld --strip-all -z noexecstack

echo init | cpio -H newc -o > init.cpio
cd ../$KERNEL_SOURCE
make isoimage FDARGS="initrd=/init.cpio" FDINITRD=../build/init.cpio