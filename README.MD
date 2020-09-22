# Huy Pham KDE Plasma configurations
This is KDE environment of HuyPQ.

## 1. Features
Distro: ArchLinux  
DE: Plasma  
WM: Kwin  
WM Theme: Arc-Dark  
Theme: Arc-Darker  
Icons: Papirus  

## 2. Installation Archlinux
### 2.1. Make bootable USB
Download Arch ISO from archlinux.org
Use Balena Etcher to flash into USB.

### 2.2. Install System
2.2.1 Prepare Root Partition

2.2.2 Copy System to Partition
```
mount /dev/sda1 /mnt
```
```
pacstrap /mnt base linux linux-firmware vim nano
genfstab -U /mnt >> /mnt/etc/fstab
```
Now use arch-chroot and enter the mounted disk as root
```
arch-chroot /mnt
```
Set timezone
```
timedatectl list-timezones
timedatectl set-timezone Asia/Ho_Chi_Minh
```

This is what sets the language, numbering, date and currency formats for your system.

```
vim /etc/locale.conf
```

Uncomment ```en_US.UTF-8```

Setup hostname
```
echo myhostname > /etc/hostname
```

Setup root password
```
passwd
```

Create user
```
useradd -m huypq6
passwd
```
Install sudo
```
pacman -S sudo
```

add this line to visudo
```
visudo
huypq6 ALL=(ALL) ALL
```
### 2.2.3 Install KDE
```
pacman -S xorg xorg-xinit
pacman -S base-devel plasma networkmanager plasma-nm
pacman -S firefox konsole dolphin
```

Enable SDDM
```
systemctl enable sddm
```

Enable Network
```
systemctl enable NetworkManager
```

### 2.2.4 Reboot
```
exit
umount /mnt
reboot
```

## 3. More Resources

### 3.1 Color scheme at

https://terminal.sexy/#OERQ5ubmHR8hpxAHFo9F7JMAJGHojjzCJ2DgxcjGlpiWzDQrAMlO-6kiOXHtqWPWOXHt____

### 3.2 Wallpaper download at

https://unsplash.com/photos

## 4. Tools

1. Create cool text at [Patorjk](http://patorjk.com/software/taag).

## 5. Vietnamese

Some KDE application has problem with ibus vietnamese input method. Need to follow this guide

```
export QT_IM_MODULE=ibus
```

to **~/.xprofile** and restart your X user session. 

## 6. Other configuration

