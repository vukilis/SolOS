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
clear

logo(){

    echo -ne "
-------------------------------------------------------------------------
                     _____           _    ____     _____ 
                    / ____|         | |  / __ \   / ____|
                   | (___     ___   | | | |  | | | (___  
                    \___ \   / _ \  | | | |  | |  \___ \ 
                    ____) | | (_) | | | | |__| |  ____) |
                   |_____/   \___/  |_|  \____/  |_____/ 
-------------------------------------------------------------------------
                         https://github.com/vukilis              
------------------------------------------------------------------------
    "
}

userinfo(){
    if ! source setup.conf; then
        read -p "Please enter username: " username
        read -p "Please enter your password: " password
        read -p "Please enter your hostname: " hostname

    # Make username lowercase
    username=${username,,}

    echo "username=$username" >> ${HOME}/SolOS/setup.conf
    echo "password=$password" >> ${HOME}/SolOS/setup.conf
    echo "hostname=$hostname" >> ${HOME}/SolOS/setup.conf
    fi
}

diskpart () {
    echo -ne "
        ------------------------------------------------
        ----------select your disk to format------------
        THIS WILL FORMAT AND DELETE ALL DATA ON THE DISK
        ------------------------------------------------
    "
    lsblk
    read -p "Please enter disk to work on: (example /dev/sda)": DISK
    echo "DISK=$DISK" >> setup.conf
}


#Call functions
logo
userinfo
clear

logo
diskpart
clear


