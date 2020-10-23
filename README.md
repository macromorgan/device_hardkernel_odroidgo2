This is my first attempt at creating an Android AOSP build using the Panfrost graphics stack.
Extra massive special thanks to notime2d8; without their help I'd be staring at a command
prompt screaming "why won't you fucking boot".

Thanks as well to the Mesa team and the glodroid team, without their help things would also
not even be getting off the ground.

The kernel in question is the 5.9 branch you can also find in my Github account.  Note that
a prebuilt version is included which you can use to generate a boot.img.  This boot.img isn't
used for anything currently, but you can use it if you want.  I also include the boot.ini
I am using to boot from uBoot. I have uBoot installed to my SD card but I'm not sure if that's
important or not.  Even using the upstream 5.9 kernel the panel still doesn't init about 10%
of the time.  Also there are a few crashes due to my blunt force insertion of some code to get
the audio to work (whether it works in Android is another matter).

To build, sync against the AOSP branch (I am using 11.0.0.r8 currently).

The definition from this repository should be saved at <<AOSP_ROOT>>/device/hardkernel/odroidgo2
Select full_odroidgo2-userdebug from the lunch menu, then build with m droid -jx (where x is
the number of CPUs you have).

To install, create an SD card with 16MB of free space at the beginning, then a 128MB BOOT partition
set as FAT32, then a >1.5GB partition set as EXT4, another EXT4 partition that is >256MB, and a final
partition as EXT4 with the remaining space on your SD card.  Once the build has finished compiling,
you will need to take the system.img and use dd to copy it to the /dev/mmcblk0p2 partition on your
SD card.  Do the same for vendor.img to the /dev/mmcblk0p3 partition.  Then, copy the boot.ini, Image,
and two DTBs from the device/hardkernel/odroidgo2/kernel folder to the boot partition.  Lastly,
generate a uInitrd image by using the following command on the ramdisk-recovery.img:

mkimage -A arm64 -O linux -T ramdisk -C none -n uInitrd -d ramdisk-recovery.img uInitrd

Copy the resultant uInitrd to the boot partition of the SD card as well.  If all goes according to plan
you should boot up into Android AOSP 11 within a minute.  If the panel fails to init, hold the power button
for a few seconds and then try turning it on again.
