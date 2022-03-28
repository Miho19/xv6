# xv6_rpi2_port with USB file system

This project aimed to reintroduce a persistent file system to the [RPI2/3](https://github.com/zhiyihuang/xv6_rpi2_port) port of xv6 by using the USB driver, [uspi](https://github.com/rsta2/uspi).

### Installation

```bash
git clone https://github.com/Miho19/xv6.git
cd xv6
```

### Compilation

```bash
cd uprogs/
make
cp fs.img initcode ../source/.
cd ..
make loader
```

### Running

```bash
sudo cp kernel7.img /boot/kernel-xv6.img
sudo vim /boot/config
reboot
```

_/boot/config_

add the following to the end, making sure to comment out `kernel=` of any older images

```
kernel=kernel-xv6.img
kernel_old=1
disable_commandline_tags=1
enable_uart=1
```

### Usage within xv6

Make sure to connect a USB mass storage device i.e. flash drive. **All operations performed on this flash drive are permanent and destructive, previous data will be overridden.**

```bash
usbmkfs
mount
```

- Usbmkfs will display the first freeblock which indicates a successful establishment of the file system on the flash drive.
- Mount allows the native xv6 file system to interact with the USB file system.

**When using the USB, all paths must be absolute. If you cd into the usb you will be unable to access commands present on the host file system.**

```bash
ls /usb
cat /usb/filename.txt
```

### Acknowledgements

[Zhiyi Huang](https://github.com/zhiyihuang/xv6_rpi2_port)

### Related Work

[xv6fs](https://github.com/Miho19/xv6fs) is a FUSE interface which allows a host linux system to interact with the USB formatted with the xv6 file system.
