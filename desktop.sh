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
    echo ""
    echo -e "${yellow}[+] ${green}Updating system before installation ${white}"
    sudo pacman -Syu --noconfrim
    for i in wget base-devel dialog tzdata gnupg dbus curl nano git xz at-spi2-core xfce4 xfce4-goodies xfce4-terminal librsvg inetutils dbus gtk-engine-murrine firefox gtk2-engines-pixbuf pulseaudio
    do
        if [ -f /var/lib/pacman/db.lck ]
        then
            sudo rm -rf /var/lib/pacman/db.lck
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

vscode(){
    echo -e "${yellow}[+] ${green}Installing vscode${white}"
    echo ""
    git clone https://aur.archlinux.org/visual-studio-code-bin.git
    cd visual-studio-code-bin
    makepkg -si
}

Yay(){
    echo -e "${yellow}[+] ${green}Installing yay${white}"
    echo ""
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
}

note(){
   # creating x11-start file
   touch x11-start
   echo "#! /bin/bash" >> x11-start
   echo "export DISPLAY=:1" >> x11-start
   echo "xfce4-session > /dev/null 2>&1" >> x11-start

   echo "#! /bin/bash" >> x11-stop
   echo "xfce4-session-logout --logout" >> x11-stop

   chmod 777 x11-start x11-stop && sudo mv x11-stop x11-start /usr/bin

   banner
   echo -e "${yellow}[+] ${green}install ${cyan}termux x11${green} app from github"
   echo ""
   echo -e "${yellow}[+] ${green}simply type ${cyan}x11-start ${green}to start desktop environment"
   echo ""
   echo -e "${yellow}[+] ${green}open ${cyan}termux x11 ${green}app and enjoy"
   echo ""
   echo -e "${yellow}[+] ${green}stop x11 service by ${cyan}CTRL + C"
   echo ""
}

envsetup(){
     banner

     echo -e "${yellow}[+] ${green}installing and setting up themes icons wallpapers"
     echo ""
     wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/candy-icons-master.tar.xz 
     wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/Sweet-Ambar-Blue-Dark-v40.tar.xz 
     wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/01-WhiteSur.tar.xz 
     wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/WhiteSur-Dark.tar.xz 
     wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/Sweet-cursors.tar.xz 
     wget https://raw.githubusercontent.com/Anon-404/My-assets/main/archlinux/arch-linux-1920-x-1080-wallpaper-n3wmkn6n4ctn2j9m.jpg -O /usr/share/backgrounds/arch-linux-1920-x-1080-wallpaper-n3wmkn6n4ctn2j9m.jpg
     wget https://raw.githubusercontent.com/Anon-404/My-assets/main/archlinux/com0613.jpg -O /usr/share/backgrounds/com0613.jpg
     wget https://raw.githubusercontent.com/Anon-404/My-assets/main/archlinux/config.tar.xz


     rm -rf .config
     sudo tar -xvf Sweet-cursors.tar.xz -C "/usr/share/icons"
     sudo tar -xvf Sweet-Ambar-Blue-Dark-v40.tar.xz -C "/usr/share/themes/"
     sudo tar -xvf candy-icons-master.tar.xz -C "/usr/share/icons"
     sudo tar -xvf WhiteSur-Dark.tar.xz -C "/usr/share/themes"
     sudo tar -xvf 01-WhiteSur.tar.xz -C "/usr/share/icons"
     tar -xvf config.tar.xz -C "$HOME/"


     sleep 4
}

fixSound() {
        echo -e "${yellow}[+] ${green}Fixing sound${white}"
        echo "$(echo "bash ~/.sound" | cat - /data/data/com.termux/files/usr/bin/arch)" > /data/data/com.termux/files/usr/bin/arch
        echo "export DISPLAY=:1" >> /etc/profile
        echo "export PULSE_SERVER=127.0.0.1" >> /etc/profile
        source /etc/profile
}

cleanup(){
     echo ""
     echo -e "${yellow}[+] ${green}refreshing system ${white}"
     echo ""
     rm -rf candy-icons-master.tar.xz Sweet-cursors.tar.xz Sweet-Ambar-Blue-Dark-v40.tar.xz config.tar.xz WhiteSur-Dark.tar.xz 01-WhiteSur.tar.xz
     sudo pacman -Syu --noconfirm
}

# call funcs

banner
pkgInstaller
vscode
Yay
envsetup
fixSound
cleanup
note
