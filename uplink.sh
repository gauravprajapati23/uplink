#!/bin/bash

# --- COLORS & STYLING ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# --- ROOT CHECK ---
if [ "$EUID" -ne 0 ]; then
  echo -e "${RED}[!] Please run as root: sudo ./uplink.sh${NC}"
  exit
fi

# --- UI HEADER (Updated Name) ---
show_header() {
    clear
    echo -e "${CYAN}======================================================${NC}"
    echo -e "${CYAN}           🚀  UPLINK : NETWORK FIXER  🚀             ${NC}"
    echo -e "${CYAN}======================================================${NC}"
    echo -e "${BLUE}             Created by : The Matrix                  ${NC}"
    echo -e "${CYAN}======================================================${NC}"
    echo ""
}

# --- FIX FUNCTIONS ---

fix_wifi_logic() {
    echo -e "${YELLOW}[*] Restarting Network Manager...${NC}"
    service NetworkManager restart
    rfkill unblock wifi
    nmcli radio wifi on
    echo -e "${GREEN}[✔] Wi-Fi Services Refreshed!${NC}"
}

fix_bt_logic() {
    echo -e "${YELLOW}[*] Starting Bluetooth Services...${NC}"
    service bluetooth start
    rfkill unblock bluetooth
    # Force power on via controller
    echo -e "power on\nquit" | bluetoothctl > /dev/null 2>&1
    echo -e "${GREEN}[✔] Bluetooth Services Refreshed!${NC}"
}

install_drivers_logic() {
    # INTERNET CHECK
    echo -e "${YELLOW}[*] Checking Internet Connection...${NC}"
    if ping -q -c 1 -W 2 google.com >/dev/null; then
        echo -e "${GREEN}[✔] Internet Connected! Starting Download...${NC}"
        echo ""
        
        echo -e "${BLUE}[1/3] Updating Repositories...${NC}"
        apt update -y
        
        echo -e "\n${BLUE}[2/3] Installing Drivers (Realtek/Intel/Atheros)...${NC}"
        apt install -y firmware-linux firmware-realtek firmware-iwlwifi firmware-atheros
        
        echo -e "\n${BLUE}[3/3] Installing Bluetooth Tools (Blueman)...${NC}"
        apt install -y bluetooth bluez bluez-tools rfkill blueman
        
        echo -e "\n${GREEN}[✔] All Drivers Installed! Now fixing services...${NC}"
        fix_wifi_logic
        fix_bt_logic
    else
        # NO INTERNET MESSAGE (RED ERROR)
        echo ""
        echo -e "${RED}❌ NO INTERNET CONNECTION ❌${NC}"
        echo -e "${RED}[!] Please connect USB Tethering and try again.${NC}"
        echo ""
        echo -e "${YELLOW}Returning to menu in 3 seconds...${NC}"
        sleep 3
    fi
}

# --- MAIN LOOP ---
while true; do
    show_header
    
    echo -e "${GREEN}1.${NC} Fresh Setup (Drivers + Fix) 🛠️"
    echo -e "${GREEN}2.${NC} Fix Wi-Fi Only 📶"
    echo -e "${GREEN}3.${NC} Fix Bluetooth Only 🦷"
    echo -e "${RED}4.${NC} Quit ❌"
    
    echo ""
    echo -e "${CYAN}------------------------------------------------------${NC}"
    echo -e "${CYAN}Select an option [1-4]: ${NC}\c"
    read choice
    echo ""

    case $choice in
        1)
            install_drivers_logic
            echo -e "\nPress Enter to return..."
            read
            ;;
        2)
            fix_wifi_logic
            echo -e "\nPress Enter to return..."
            read
            ;;
        3)
            fix_bt_logic
            echo -e "\nPress Enter to return..."
            read
            ;;
        4)
            echo -e "${RED}Exiting... Have a nice day! 👋${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}[!] Invalid Selection. Try again.${NC}"
            sleep 1
            ;;
    esac
done
