#! /bin/bash
#
##########################################
#                                        #
#          presented : Anon404           #
#        Author : William Steven         #
#                                        #
##########################################
#____colors____
black='\033[1;30m'
red='\033[1;31m'
green='\033[1;32m'
yellow='\033[1;33m'
blue='\033[1;34m'
magenta='\033[1;35m'
cyan='\033[1;36m'
white='\033[1;37m'

banner(){
        clear
        echo -e "${blue}################################################################"
        echo ""
        echo "   ___   ___  _______ __    _  ________"
        echo "  / _ | / _ \/ ___/ // /___| |/_<  <  /"
        echo " / __ |/ , _/ /__/ _  /___/>  < / // / "
        echo "/_/ |_/_/|_|\___/_//_/   /_/|_|/_//_/  "
        echo "                                       "
        echo -e "${green}presented by : Anon404"
        echo "created by : William Steven"
        echo -e "${blue}"
        echo "################################################################"
        echo ""
}

pkgInstaller(){
    for i in exa starship bat fzf pkgfile ugrep
    do
        if [ -f /var/lib/pacman/db.lck ]
        then
            rm -rf /var/lib/pacman/db.lck
        fi
        echo ""
        echo -e "${yellow}[+] ${green}Installing $i ${white}"
        echo ""

        while ! sudo pacman -S --noconfirm $i --needed; do
            echo -e "${red}[-] Failed to install $i. Retrying...${white}"
            sleep 2
        done

        echo -e "${green}[+] Successfully installed $i ${white}"
    done
}

Yay(){
    echo -e "${yellow}[+] ${green}Installing yay${white}"
    echo ""
    git clone https://aur.archlinux.org/yay.git
    cd yay
    while ! makepkg -si ; do
        echo -e "${red}[-] Failed to installing yay. Retrying...${white}"
        sleep 2
    done
    cd
    rm -rf yay
}
confterm(){
        banner
        pkgInstaller
	echo ""
        echo -e "${yellow}[+] ${green}configuring terminal"
	echo ""
        rm -rf .bashrc /etc/bash.bashrc .config/fish/config.fish
        wget https://raw.githubusercontent.com/Anon-404/My-assets/main/archlinux/config.fish -O .config/fish/config.fish
        wget https://raw.githubusercontent.com/Anon-404/My-assets/main/archlinux/bash.bashrc -O /etc/bash.bashrc
        wget https://raw.githubusercontent.com/Anon-404/My-assets/main/archlinux/bash.bashrc -O .bashrc


        git clone https://aur.archlinux.org/find-the-command.git
        cd find-the-command
        makepkg -si
	sleep 2
	cd
	rm -rf find-the-command
}

note(){
    banner
    echo -e "${yellow}[+] ${green}exit termux and open again then type ${cyan}archlinux"
    echo ""
    echo -e "${yellow}[+] ${green}now enjoy archlinux with customised terminal"
    echo ""
    echo -e "${yellow}[+] ${green}to install gui just run ${cyan}bash desktop.sh"
    echo ""
}

banner
confterm
Yay
note
