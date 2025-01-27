# tiny-linux-distro

## Kernel update
Make sure you have flex bison libncurses5-dev libncursesw5-dev libelf-dev elfutils bc syslinux isolinux installed
```
make tinyconfig
```

```
make menuconfig
```
Select:
* "64-bit kernel" (for x86-64 support, depending on architecture support this may vary)
* "General setup --> Inital RAM filesystem and RAM disk support" (initramfs)
* Under "initramfs support" disable ALL the compression types
* Verify "General setup --> Configure standard kernel features" is enabled.
* "General setup --> Configure standard kernel features --> Enable support for printk"
* "Device drivers --> Character devices --> Enable TTY"
* "Executable file formats --> Kernel support for ELF binaries"
* Save changes

```
make -jN
```

Testing:
```
qeum-system-x86-64 -kernel <path-to-kernel-image>
```
`<path-to-kernel-image>` most likely will be equal to: `arch/x86/boot/bzImage`.

[reference](https://en.wikipedia.org/wiki/X86_calling_conventions#System_V_AMD64_ABI)