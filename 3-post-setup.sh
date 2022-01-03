#!/usr/bin/env bash
#-------------------------------------------------------------------------
#  .d8888b.           888  .d88888b.   .d8888b.  
# d88P  Y88b          888 d88P" "Y88b d88P  Y88b 
# Y88b.               888 888     888 Y88b.      
#  "Y888b.    .d88b.  888 888     888  "Y888b.   
#     "Y88b. d88""88b 888 888     888     "Y88b. 
#       "888 888  888 888 888     888       "888 
# Y88b  d88P Y88..88P 888 Y88b. .d88P Y88b  d88P 
#  "Y8888P"   "Y88P"  888  "Y88888P"   "Y8888P" 
#-------------------------------------------------------------------------

echo -e "\nFINAL SETUP AND CONFIGURATION"
echo "--------------------------------------"
echo "-- GRUB EFI Bootloader Install&Check--"
echo "--------------------------------------"
if [[ -d "/sys/firmware/efi" ]]; then
    grub-install --efi-directory=/boot ${DISK}
fi
grub-mkconfig -o /boot/grub/grub.cfg

# ------------------------------------------------------------------------

echo -e "\nEnabling Login Display Manager"
systemctl enable sddm.service
echo -e "\nSetup SDDM Theme"
cat <<EOF > /etc/sddm.conf
[Theme]
Current=Nordic
EOF

# ------------------------------------------------------------------------

echo -e "\nEnabling essential services"

systemctl enable cups.service
ntpd -qg
systemctl enable ntpd.service
systemctl disable dhcpcd.service
systemctl stop dhcpcd.service
systemctl enable NetworkManager.service
systemctl enable bluetooth
echo "
###############################################################################
# Cleaning
###############################################################################
"
# Remove no password sudo rights
sed -i 's/^%wheel ALL=(ALL) NOPASSWD: ALL/# %wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers
# Add sudo rights
sed -i 's/^# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers

# Replace in the same state
cd $pwd