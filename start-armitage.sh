#!/bin/bash

# ----------------------------
# Script: start_armitage.sh
# Purpose: Starts PostgreSQL, msfrpcd, sets environment variable, and launches Armitage
# ----------------------------

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color

echo -e "${BLUE}[*] Starting PostgreSQL service...${NC}"
if sudo systemctl start postgresql.service; then
    echo -e "${GREEN}[+] postgresql.service started${NC}"
else
    echo -e "${RED}[-] Failed to start postgresql.service${NC}"
    exit 1
fi

# Put your msfrpcd credentials here which you set during the setup.
RPC_USER="msf"
RPC_PASS="1234"

echo -e "${BLUE}[*] Starting msfrpcd service...${NC}"
sudo msfrpcd -U "$RPC_USER" -P "$RPC_PASS" -S &

echo -e "${GREEN}[+] msfrpcd started${NC}"
echo -e "${YELLOW}    Username:${NC} $RPC_USER"
echo -e "${YELLOW}    Password:${NC} $RPC_PASS"

echo -e "${BLUE}[*] Exporting MSF_DATABASE_CONFIG environment variable...${NC}"
export MSF_DATABASE_CONFIG="$(ls ~/.msf4/database.yml)"
echo -e "${GREEN}[+] Variable exported successfully${NC}"

echo -e "${CYAN}[*] Launching Armitage in 2 seconds...${NC}"
sleep 2
armitage
