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
  .d8888b.           888  .d88888b.   .d8888b.  
 d88P  Y88b          888 d88P" "Y88b d88P  Y88b 
 Y88b.               888 888     888 Y88b.      
  "Y888b.    .d88b.  888 888     888  "Y888b.   
     "Y88b. d88""88b 888 888     888     "Y88b. 
       "888 888  888 888 888     888       "888 
 Y88b  d88P Y88..88P 888 Y88b. .d88P Y88b  d88P 
  "Y8888P"   "Y88P"  888  "Y88888P"   "Y8888P"  
-------------------------------------------------------------------------
        https://github.com/vukilis              
------------------------------------------------------------------------
    "
}

userinfo(){
    # echo -ne "Please enter username: "
    # read username
    # echo "username=$username" >> ${HOME}/SolOS/setup.conf
    # echo -ne "Please enter your password: "
    # read password
    # echo "password=$password" >> ${HOME}/SolOS/setup.conf
    # echo -ne "Please enter your hostname: "
    # read hostname
    # echo "hostname=$hostname" >> ${HOME}/SolOS/setup.conf
    if ! source setup.conf; then
        read -p "Please enter username:" username
        read -p "Please enter your password:" password
        read -p "Please enter your hostname:" hostname

    # Make username lowercase
    username=${username,,}

    echo "username=$username" >> ${HOME}/SolOS/setup.conf
    echo "username=$password" >> ${HOME}/SolOS/setup.conf
    echo "username=$hostname" >> ${HOME}/SolOS/setup.conf
    fi
}

userinfo
clear





