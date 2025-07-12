#!/bin/bash
# plank-fsociety.sh
# Termux hacking multi-tool by ChatGPT x PlankDev

# Color codes
r='\033[1;31m'
g='\033[1;32m'
y='\033[1;33m'
b='\033[1;34m'
c='\033[1;36m'
w='\033[1;37m'
reset='\033[0m'

banner() {
    clear
    echo -e "${r}"
    echo " ██████╗░██╗░░░░░░█████╗░███╗░░██╗██╗░░██╗  ███████╗░██████╗░░█████╗░░█████╗░██████╗░"
    echo " ██╔══██╗██║░░░░░██╔══██╗████╗░██║╚██╗██╔╝  ██╔════╝██╔════╝░██╔══██╗██╔══██╗██╔══██╗"
    echo " ██████╦╝██║░░░░░███████║██╔██╗██║░╚███╔╝░  █████╗░░██║░░██╗░██║░░██║██║░░██║██║░░██║"
    echo " ██╔══██╗██║░░░░░██╔══██║██║╚████║░██╔██╗░  ██╔══╝░░██║░░╚██╗██║░░██║██║░░██║██║░░██║"
    echo " ██████╦╝███████╗██║░░██║██║░╚███║██╔╝╚██╗  ██║░░░░░╚██████╔╝╚█████╔╝╚█████╔╝██████╔╝"
    echo " ╚═════╝░╚══════╝╚═╝░░╚═╝╚═╝░░╚══╝╚═╝░░╚═╝  ╚═╝░░░░░░╚═════╝░░╚════╝░░╚════╝░╚═════╝░"
    echo -e "${y}              BY: PLANK DEV  |  TEAM GOVERNING DIGITAL${reset}"
    echo
}

install_dependencies() {
    echo -e "${b}[*] Installing dependencies...${reset}"
    pkg update -y && pkg upgrade -y
    pkg install git nmap python php curl openssh tsu -y
    pip install requests
    pkg install figlet toilet -y
    pkg install mpv -y > /dev/null 2>&1
}

ddos_tool() {
    git clone https://github.com/TheSpeedX/TBomb
    cd TBomb && ./TBomb.sh
}

nmap_tool() {
    read -p "Enter target IP or domain: " target
    nmap -A $target
}

john_ripper() {
    pkg install unstable-repo -y
    pkg install john -y
    echo -e "${g}[*] Sample wordlist: /data/data/com.termux/files/usr/share/wordlists/rockyou.txt${reset}"
    read -p "Enter hash file path: " hashfile
    john $hashfile
}

location_tracker() {
    git clone https://github.com/thewhiteh4t/seeker
    cd seeker && bash install.sh && python3 seeker.py
}

phishing_tool() {
    git clone https://github.com/htr-tech/zphisher
    cd zphisher && bash zphisher.sh
}

ransomware_generator() {
    git clone https://github.com/Veil-Framework/Veil
    cd Veil && ./Veil.py
}

spam_sms() {
    git clone https://github.com/siputra12/prank
    cd prank && bash prank.sh
}

while true; do
    banner
    echo -e "${c}1.${w} DDoS Tool"
    echo -e "${c}2.${w} Nmap Scan"
    echo -e "${c}3.${w} John The Ripper"
    echo -e "${c}4.${w} Location Tracker"
    echo -e "${c}5.${w} Phishing Page Generator"
    echo -e "${c}6.${w} Ransomware Creator"
    echo -e "${c}7.${w} SMS Spammer"
    echo -e "${c}8.${w} Install Dependencies"
    echo -e "${c}0.${w} Exit"
    echo
    read -p "[?] Select an option: " opt
    case $opt in
        1) ddos_tool ;;
        2) nmap_tool ;;
        3) john_ripper ;;
        4) location_tracker ;;
        5) phishing_tool ;;
        6) ransomware_generator ;;
        7) spam_sms ;;
        8) install_dependencies ;;
        0) exit ;;
        *) echo -e "${r}[!] Invalid Option${reset}"; sleep 1 ;;
    esac
done
