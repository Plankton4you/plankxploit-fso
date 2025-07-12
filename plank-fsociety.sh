#!/bin/bash

# Warna
red='\033[1;31m'
green='\033[1;32m'
blue='\033[1;34m'
white='\033[1;37m'
nc='\033[0m' # no color

# Banner
banner() {
  clear
  echo -e "${green}"
  echo "╔═══════════════════════════════════════╗"
  echo "║      WELCOME TO PLANK DEV TOOLS       ║"
  echo "║       Inspired by fsociety tool       ║"
  echo "╚═══════════════════════════════════════╝"
  echo -e "${nc}"
  echo -e "${blue}Author:${nc} PLANK DEV"
  echo -e "${blue}Tools  :${nc} Termux Toolkit - fsociety style\n"
}

# Menu
menu() {
  echo -e "${green}Select an option:${nc}"
  echo -e "${white}[1]${nc} Nmap (Network Scanner)"
  echo -e "${white}[2]${nc} Admin Finder"
  echo -e "${white}[3]${nc} RED_HAWK (Info Gathering)"
  echo -e "${white}[4]${nc} Install All Tools"
  echo -e "${white}[0]${nc} Exit"
}

# Tools
run_tool() {
  case $1 in
    1)
      echo -e "${green}Installing & Running Nmap...${nc}"
      pkg install nmap -y
      read -p "Target IP/Host: " target
      nmap $target
      ;;
    2)
      echo -e "${green}Cloning Admin Finder...${nc}"
      git clone https://github.com/the-c0d3r/admin-finder.git
      cd admin-finder
      python2 admin-finder.py
      cd ..
      ;;
    3)
      echo -e "${green}Cloning RED_HAWK...${nc}"
      git clone https://github.com/Tuhinshubhra/RED_HAWK
      cd RED_HAWK
      php rhawk.php
      cd ..
      ;;
    4)
      echo -e "${green}Installing all tools...${nc}"
      pkg install nmap git php python python2 -y
      echo "Cloning RED_HAWK..."
      git clone https://github.com/Tuhinshubhra/RED_HAWK
      echo "Cloning Admin Finder..."
      git clone https://github.com/the-c0d3r/admin-finder.git
      ;;
    0)
      echo -e "${red}Exiting...${nc}"
      exit 0
      ;;
    *)
      echo -e "${red}Invalid option, bro!${nc}"
      ;;
  esac
}

# Main
while true; do
  banner
  menu
  echo
  read -p "Your choice => " choice
  run_tool $choice
  echo -e "\n${blue}Press Enter to return to menu...${nc}"
  read
done