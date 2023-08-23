# Automatically mount partition tool

This tool was developed mainly as a study of GNU Bash, since the OS already has mechanisms to do this.

### GNU/Linux solution

The following are the steps to use the GNU/Linux built-in tool to automatically mount partitions:

1. Get the UUID (Universal Unique Identifier) of the device you want to be mounted on boot
    * `blkid`
2. Add an entry in /etc/fstab
    * `sudo nano /etc/fstab`
    * `UUID=<partition_UUID> <mount_point> <filesystem_type> <options> <dump> <pass>`
      * UUID: The Universally Unique Identifier of the partition. You can find this using the blkid command.
      * mount_point: The directory where the partition should be mounted.
      * filesystem_type: The type of filesystem on the partition (e.g., ext4, ntfs, etc.).
      * options: Mount options like defaults, noauto, etc.
      * dump and pass: Used by the dump and fsck utilities.
3. Save and exit
4. Test the configuration
    * `sudo mount -a`
5. Reboot
    * `reboot` or `shutdown now -r`