#!/bin/bash

RED="\033[31m"
GREEN="\u001b[32;1m"
YELLOW="\u001b[33;1m"
CYAN="\033[36m"
RESET="\033[0;39m"
BLUE="\u001b[34;1m"
warn="$RED[!]$NORMAL"
inf="$BLUE[~]$NORMAL"
succ="$GREEN[+]$NORMAL"

yes="y"
no="n"

FAILURE=1

printf "\n $CYAN"
echo " 
_________________________________________
                  ##						
                 ####
                ######
               ########
              ##########		
             ############
            ##############				
           ################
          ##################
         ####################
        ######################
       #########      #########
      ##########      ##########
     ###########      ###########
    ##########          ##########
   #######                  #######
  ####                          ####
 ###                              ### 
_________________________________________

 "
printf "$RESET"
printf "$RED This script developed by Melih isbilen https://github.com/melihi $RESET"

sysinfo(){
	printf "\n $inf Whoami:$RED $( whoami ) $RESET"
	printf "\n $inf Hostname:$RED $(hostname) $RESET"
	printf "\n $inf Users :$RED $( users ) $RESET"
	printf "\n $inf Local Ip :$RED $(hostname -i) $RESET"
	printf "\n $inf Public Ip :$RED $(curl -s ifconfig.me/ip) $RESET"
	printf "\n $inf Sysinfo:$RED $(cat /proc/version) $RESET"
	printf "\n $inf Disk :\n$RED $( lsblk ) $RESET"
	printf "\n $inf Memory :\n$RED $(free -mh) $RESET"


}

start(){

	printf "\n $inf 1-) $GREEN  Install BlackArch strap.sh (requirement for security tools) tools $NORMAL"
	printf "\n $inf 2-) $GREEN  Install Security tools $NORMAL"
	printf "\n $inf 3-) $GREEN  Install Programming tools $NORMAL"
	printf "\n $inf 4-) $GREEN  Install Text editors $NORMAL"
	printf "\n $inf 5-) $GREEN  Install VmWare tools $NORMAL"
	printf "\n $inf 6-) $GREEN  Install VirtualBox tools $NORMAL"
	printf "\n $inf 7-) $GREEN  Install Xfce lightdm desktop enviroment  $NORMAL"
	printf "\n $inf 8-) $GREEN  Install Lxdm lxde desktop enviroment  $NORMAL"
	printf "\n $inf 9-) $GREEN  Install Extra tools  $NORMAL"
	printf "\n $inf 10-) $GREEN  Create User and Home directory  $NORMAL"

	selection
}
trap ctrl_c 2

ctrl_c(){
  printf "\033c"
  printf "\n $RESET Keyboard Interrupt detected, leaving...\n  https://github.com/melihi"
  
  exit "$FAILURE"
}

green_text(){
  printf "$BLUE $1 $RESET"
}
yellow_text(){
  printf "$YELLOW $1 $RESET"
}
red_text(){
  printf "$RED $1 $RESET"
}



selection(){
	read -p "What do you want ? :> " selection

	case $selection in
	   1)
	    printf "\033c"
	    printf "$inf $CYAN BlackArch strap.sh :\n $RESET" 
	    printf "Do you want to install ? y/n :"
	    read -p "" selection1
	    if [ "$selection1" = "$yes" ]; then
	      
	    	strap
	    else 
	     printf "\033c"
	     start
	    fi
	    ;;	
	  2)
	    printf "\033c"
	    printf "$inf $CYAN Security tools :" 
	    printf """
		    1-)Nmap
		    2-)Masscan
		    3-)Nikto
		    4-)Amass
		    5-)Subfinder
		    6-)Sublist3r
		    7-)Wireshark
		    8-)Gospider
		    9-)Dirb
		    10-)Ffuf
		    11-)Gospider
		    12-)Burp Suite
		    13-)Zaproxy
		    14-)Gobuster
		    15-)Metasploit
		    16-)Sqlmap
		    17-)Wpscan
		    18-)Binwalk
	    $RESET
	    """
	    printf "Do you want to install ? y/n :"
	    read -p "" selection2
	    
	    if [ "$selection2" = "$yes" ]; then
	      
	     security_tools
	    else 
	     printf "\033c"
	     start
	    fi
	    ;;
	  3)
	    printf "\033c"
	    printf "$inf $CYAN Programming tools :"
	    
	    printf """
	    	1-)Netbeans
	    	2-)Python3
	    	3-)Java JRE
		4-)Spyder python ide
	    $RESET
	    """
 	    printf "Do you want to install ? y/n :"
	    read -p "" selection3
	    
	    if [ "$selection3" = "$yes" ]; then
	      
	     programming_tools
	    else 
	     printf "\033c"
	     start
	    fi
	    ;;
	  4)
	    printf "\033c"
	    printf "$inf $CYAN Text editors :"
	    printf """
	    	1-)gedit
	    	2-)geany
	    	3-)nano
	    	
	    $RESET
	    """
	    printf "Do you want to install ? y/n :"
	    read -p "" selection4
	    
	    if [ "$selection4" = "$yes" ]; then
	      
	     editor_tools
	    else 
	     printf "\033c"
	     start
	    fi
	    ;;
	  5)
	    printf "\033c"
	    printf "$inf $CYAN  VmWare  tools installing :\n $RESET"
	    printf "Do you want to install ? y/n :"
	    read -p "" selection5   
	    if [ "$selection5" = "$yes" ]; then     
	     pacman -S open-vm-tools 
	     systemctl enable vmware-vmblock-fuse.service 
 	     systemctl enable vmtoolsd.service 
 	     start
	    else
	     printf "\033c" 
	     start
	    fi
	    ;;	
	  6)
	   printf "\033c"
	   printf "$inf $CYAN VirtualBox  tools installing :\n $RESET"
	   printf "Do you want to install ? y/n :"
	   read -p "" selection6   
	   if [ "$selection6" = "$yes" ]; then     
	     pacman -S virtualbox-guest-utils
	     systemctl enable vboxservice
	     start
	   else
	     printf "\033c"
	     start
	    fi  
	    ;;
	  7)
	   printf "\033c"
	   printf """$inf $CYAN Desktop enviroment : 
		1-) Xfce 
 		2-) lightdm 
		3-) xorg  :\n $RESET"""
	    printf "Do you want to install ? y/n :"
	   read -p "" selection7   
	   if [ "$selection7" = "$yes" ]; then     
	     desktop_enviroment
	   else 
	     printf "\033c"
	     start
	    fi
	    ;;	
	  8)
	   printf "\033c"
	   printf """$inf $CYAN Desktop enviroment : 
		1-) Lxde 
 		2-) Lxdm  :\n $RESET"""
	    printf "Do you want to install ? y/n :"
	   read -p "" selection8   
	   if [ "$selection8" = "$yes" ]; then     
	     desktop_enviroment_lxde
	   else 
	     printf "\033c"
	     start
	    fi
	    ;;	
	  9)
	   printf "\033c"
	   printf """$inf $CYAN Extra tools : 
		1-) gdb 
		2-) gcc
		3-) netcat
		4-) net-tools
		5-) net-snmp 
		6-) whois bind 
		7-) openvpn 
		8-) arp-scan 
		9-) seclists 
		10-) neofetch 
		11-) python-pip 
		12-) torctl 
		13-) obfs4proxy 
		14-) openssh 
		15-) tmux 
		16-) htop
		17-) oh-my-zsh
		18-) firefox
 		\n $RESET"""
	   printf "Do you want to install ? y/n :"
	   read -p "" selection9
	   if [ "$selection9" = "$yes" ]; then     
	     extra_tools
	   else 
	     printf "\033c"
	     start
	    fi
	    ;;
	  10)
	   printf "\033c"
	   printf """$inf $CYAN Creating user and Home directory : 
		1-) User 
 		2-) Home directory
		3-) Sudo group :\n $RESET"""
	    printf "Username :"
	    read  username
	    printf "Password :"
	    read  password   
	     
	    sudo useradd  -d /home/$username -m $username -p $password
	    echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
	    printf "\033c"
	    start
	    ;;		
	  *)
	    printf "\n $warn INVALID \n"
	    start
	    ;;
	esac

}

strap(){
	yellow_text "$inf \n Strap.sh installation started . . .\n"
	# Run https://blackarch.org/strap.sh as root and follow the instructions.
	curl -O https://blackarch.org/strap.sh
	# Set execute bit
	chmod +x strap.sh
	# Run strap.sh
	sudo ./strap.sh
	# Enable multilib following https://wiki.archlinux.org/index.php/Official_repositories#Enabling_multilib and run:
	sudo pacman -Syu
	green_text "$succ  Strap.sh installation finished . . . \n"
	start
}
security_tools(){
	yellow_text "$inf  SECURITY tools installation started . . . \n"
	pacman -S nmap masscan nikto amass subfinder sublist3r wireshark-qt gospider dirb ffuf gospider burpsuite zaproxy gobuster metasploit sqlmap wpscan blackarch-config-xfce binwalk
    	green_text "$succ  SECURITY tools installation finished . . . \n"
	start
}
programming_tools(){
	yellow_text "$inf  Programming tools installation started . . . \n"
	pacman -S  jre-openjdk netbeans spyder
 	green_text "$succ  Programming tools installation finished . . . \n"
	start	
}
editor_tools(){
	yellow_text "$inf  Text editor installation started . . . \n"
	pacman -S gedit nano geany
	green_text "$succ  Text editor installation finished . . . \n"
	start
}
extra_tools(){
	yellow_text "$inf  Extra tools installation started . . . \n"
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	sudo pacman -S gdb gcc netcat net-tools net-snmp whois bind openvpn arp-scan seclists neofetch python-pip torctl obfs4proxy openssh tor-browser-en firefox
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	green_text "$succ  Extra tools installation finished . . . \n"
	start
}	
desktop_enviroment(){
	yellow_text "$inf  Xfce4 installation started . . . \n"
	pacman -S xorg xfce4 xfce4-goodies lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
	systemctl enable lightdm
	green_text "$succ  Xfce4 installation finished . . . \n"
	start
}
desktop_enviroment_lxde(){
	yellow_text "$inf  Lxde installation started . . . \n"
	pacman -S lxde lxdm 
	systemctl enable lxdm
	green_text "$succ  Lxde installation finished . . . \n"
	start
}
 

sysinfo
start












