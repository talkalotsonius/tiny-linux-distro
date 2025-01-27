# tiny-linux-distro
This is a shot demonstration on how to create a small Linux kernel based on the [Linux kernel sources](https://github.com/torvalds/linux/). We are using the x86-64 architecture and will implement a very rudimentary and light-weight shell.

## Configure the Kernel
Make sure you have the latest packages `flex bison libncurses5-dev libncursesw5-dev libelf-dev elfutils bc syslinux isolinux` installed.
1. `make tinyconfig` -- This will create a small lightweight kernel config.
2. `make menuconfig` -- This will give you the kernel configuration menu. In here you will make the following adjustments:
    * "64-bit kernel" (for x86-64 support, depending on architecture support this may vary)
    * "General setup --> Initial RAM filesystem and RAM disk support" (initramfs)
    * Under "initramfs support" disable ALL the compression types
    * Verify "General setup --> Configure standard kernel features" is enabled.
    * "General setup --> Configure standard kernel features --> Enable support for printk"
    * "Device drivers --> Character devices --> Enable TTY"
    * "Executable file formats --> Kernel support for ELF binaries"
    * Save changes

## Build the custom lightweight shell and integrate it into the kernel
Execute the `./build.sh` file and this will manage all the compiling & building for you.

## Test the kernel
To test the created kernel you can use QEMU.
* Testing of the 'blank' kernel image itself: `qeum-system-x86-64 -kernel <path-to-kernel-image>`, `<path-to-kernel-image>` most likely will be equal to: `arch/x86/boot/bzImage`.
* Testing of the kernel image containing the built lightweight shell: `qeum-system-x86-64 -cdrom <path-to-iso>`, `<path-to-iso>` most likely will be equal to: ` arch/x86/boot/image.iso`.

## References
* [x86-64 calling conventions - Wikipedia](https://en.wikipedia.org/wiki/X86_calling_conventions#System_V_AMD64_ABI)
* [Intel Architectures Software Developer Manuals](https://www.intel.com/content/www/us/en/developer/articles/technical/intel-sdm.html)
