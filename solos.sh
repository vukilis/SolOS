#!/bin/bash

echo "--------------------------------------"
echo "------ SolOS installation begun ------"
echo "--------------------------------------" && sleep 1

bash 0-preinstall.sh
arch-chroot /mnt /root/SolOS/1-setup.sh
source /mnt/root/SolOS/install.conf
arch-chroot /mnt /usr/bin/runuser -u $username -- /home/$username/SolOS/2-user.sh
arch-chroot /mnt /root/SolOS/3-post-setup.sh

echo "-------------------------------------------------------"
echo "----- Done - Please Eject Install Media and Reboot-----"
echo "-------------------------------------------------------"