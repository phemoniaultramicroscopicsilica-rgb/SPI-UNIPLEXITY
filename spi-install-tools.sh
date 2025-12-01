#!/bin/sh

# ================================
#   SPI-TOOLS v1.2-alpha (Interactive)
#   A Uniplexity Plex Project
#   Author: John
# ================================

CONFIG_FILE="./config.json"
INSTALL_PATH="/usr/local/bin"

# Colors
RED="\033[31m"
GREEN="\033[32m"
CYAN="\033[36m"
YELLOW="\033[33m"
RESET="\033[0m"

pause() {
    printf "${CYAN}\nPress ENTER to continue...${RESET}"
    read _
}

banner() {
    clear
    printf "${YELLOW}"
    echo ":(:): Uniplexity Project"
    echo "      SPI-TOOLS v1.2-alpha"
    echo
    printf "${RESET}"
}

install_spi() {
    banner
    echo "[*] Installing SPI..."

    if [ ! -f "./spi" ]; then
        printf "${RED}[ERROR] 'spi' executable not found in repo.\n${RESET}"
        pause
        return
    fi

    cp ./spi "$INSTALL_PATH/spi"
    chmod +x "$INSTALL_PATH/spi"

    echo "[*] Installing spi-tools..."
    cp ./spi-tools "$INSTALL_PATH/spi-tools"
    chmod +x "$INSTALL_PATH/spi-tools"

    printf "${GREEN}[SUCCESS] SPI and SPI-TOOLS installed globally!\n"
    echo "You can now run 'spi' and 'spi-tools' anywhere."
    printf "${RESET}"

    pause
}

show_info() {
    banner
    echo "SPI Injector v1.2-alpha"
    echo "Part of the Uniplexity Plex Project"
    echo
    echo "Features:"
    echo " - Safe injection"
    echo " - Multi-language support"
    echo " - Auto mode"
    echo " - Unlimited size mode"
    echo " - Payload from file/string"
    echo " - Malware signature scanning"
    echo
    pause
}

show_credits() {
    banner
    echo "Created by: John"
    echo "Organization: Uniplexity Plex Project"
    echo "Status: Alpha Build"
    echo
    pause
}

edit_config() {
    banner
    echo "Current Config:"
    cat "$CONFIG_FILE" 2>/dev/null || echo "{ }"
    echo
    echo "[*] Opening config in nano..."
    nano "$CONFIG_FILE"
    pause
}

reset_config() {
    banner
    echo "[*] Resetting config to defaults..."

    cat > "$CONFIG_FILE" <<EOF
{
  "max_file_size": "100MB",
  "default_mode": "Python",
  "verbose": true,
  "safe_mode": true,
  "auto_injection": true,
  "backup_host": true,
  "log_file": "spi.log"
}
EOF

    printf "${GREEN}Config restored.\n${RESET}"
    pause
}

main_menu() {
    while true; do
        banner
        echo "Select an option:"
        echo
        echo " 1) Install SPI"
        echo " 2) SPI Info"
        echo " 3) Credits"
        echo " 4) Edit Config"
        echo " 5) Reset Config"
        echo " 0) Exit"
        echo
        printf "${CYAN}Enter choice: ${RESET}"
        read choice

        case "$choice" in
            1) install_spi ;;
            2) show_info ;;
            3) show_credits ;;
            4) edit_config ;;
            5) reset_config ;;
            0) clear; exit 0 ;;
            *) printf "${RED}Invalid option.${RESET}\n"; sleep 1 ;;
        esac
    done
}

# Start interactive menu
main_menu
