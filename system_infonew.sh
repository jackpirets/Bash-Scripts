#!/bin/bash

# System Information Script with Colored Output
# This script displays: logged-in user, hostname, uname, free memory, and load average in different colors

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Clear screen for better visibility (optional)
clear

# Print header
echo -e "${CYAN}========================================${NC}"
echo -e "${WHITE}      LINUX SYSTEM INFORMATION${NC}"
echo -e "${CYAN}========================================${NC}"
echo ""

# 1. Logged In User (White color)
echo -e "${WHITE}[LOGGED IN USER]${NC}"
echo -e "${WHITE}Current User: $(whoami)${NC}"
echo -e "${WHITE}User ID: $(id -u)${NC}"
echo -e "${WHITE}Group ID: $(id -g)${NC}"
echo -e "${WHITE}Full Info: $(id)${NC}"
echo ""

# 2. Hostname (Red color)
echo -e "${RED}[HOSTNAME]${NC}"
echo -e "${RED}$(hostname)${NC}"
echo ""

# 2. System Info - uname -a (Green color)
echo -e "${GREEN}[SYSTEM INFORMATION (uname -a)]${NC}"
echo -e "${GREEN}$(uname -a)${NC}"
echo ""

# 3. Free Memory (Yellow color)
echo -e "${YELLOW}[FREE MEMORY]${NC}"
free -h | awk 'NR==1 {print "'${YELLOW}'"$0"'${NC}'"} NR==2 {print "'${YELLOW}'"$0"'${NC}'"}'
echo ""

# Alternative: More detailed memory info in Yellow
echo -e "${YELLOW}[MEMORY DETAILS]${NC}"
free -h | tail -1 | awk '{print "Available Memory: '$YELLOW'" $7 "'${NC}'"}'
echo ""

# 4. Load Average (Blue color)
echo -e "${BLUE}[LOAD AVERAGE]${NC}"
load=$(uptime | awk -F'load average:' '{ print $2 }')
echo -e "${BLUE}${load}${NC}"
echo ""

# Additional useful info (Magenta color)
echo -e "${MAGENTA}[ADDITIONAL INFO]${NC}"
echo -e "${MAGENTA}CPU Cores: $(nproc)${NC}"
echo -e "${MAGENTA}Uptime: $(uptime -p)${NC}"
echo ""

# Footer
echo -e "${CYAN}========================================${NC}"
echo -e "${CYAN}Generated at: $(date)${NC}"
echo -e "${CYAN}========================================${NC}"
