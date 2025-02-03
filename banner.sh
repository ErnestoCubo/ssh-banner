#!/bin/bash

# Definir colores ANSI
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
WHITE="\e[37m"
RESET="\e[0m"

# Obtener métricas del sistema
HOSTNAME="estiwer"
CPU_LOAD=$(top -bn1 | grep "load average" | awk '{print $10 $11 $12}' | tr -d ',')
MEMORY=$(free -h | awk '/Mem:/ {print $3 " / " $2}')
DISK=$(df -h / | awk 'NR==2 {print $3 " / " $2}')
USERS_LOGGED=$(who | wc -l)
UPTIME=$(uptime -p)
PROCESSES=$(ps aux --no-headers | wc -l)
CONTAINERS=$(($(docker ps | wc -l)-1))
FAILED_LOGINS=$(journalctl -u ssh --since "1 day ago" | grep -c "Failed password")
MESSAGES=("Hack the planet!" "Keep it simple, stupid." "Nothing is secure." "Think like an attacker." "Pwned or be pwned.")
RANDOM_MSG=${MESSAGES[$RANDOM % ${#MESSAGES[@]}]}

# ASCII Art del hostname
echo -e "${CYAN}"
echo "███████╗███████╗████████╗██╗██╗    ██╗███████╗██████╗ "
echo "██╔════╝██╔════╝╚══██╔══╝██║██║    ██║██╔════╝██╔══██╗"
echo "█████╗  ███████╗   ██║   ██║██║ █╗ ██║█████╗  ██████╔╝"
echo "██╔══╝  ╚════██║   ██║   ██║██║███╗██║██╔══╝  ██╔══██╗"
echo "███████╗███████║   ██║   ██║╚███╔███╔╝███████╗██║  ██║"
echo "╚══════╝╚══════╝   ╚═╝   ╚═╝ ╚══╝╚══╝ ╚══════╝╚═╝  ╚═╝"
echo -e "${RESET}"

# Mostrar información del sistema con colores
echo -e "${YELLOW}📌 Hostname:${RESET} ${WHITE}$HOSTNAME${RESET}"
echo -e "${GREEN}🖥  CPU Load:${RESET} ${WHITE}$CPU_LOAD${RESET}"
echo -e "${MAGENTA}💾 RAM Usage:${RESET} ${WHITE}$MEMORY${RESET}"
echo -e "${BLUE}📀 Disk Usage:${RESET} ${WHITE}$DISK${RESET}"

# Información extra del sistema
echo -e "${CYAN}👥 Connected users:${RESET} ${WHITE}$USERS_LOGGED${RESET}"
echo -e "${YELLOW}⏳ Uptime:${RESET} ${WHITE}$UPTIME${RESET}"
echo -e "${GREEN}⚙️  Processes in execution: ${RESET} ${WHITE}$PROCESSES${RESET}"
echo -e "${MAGENTA}🐳 Up Docker containers: ${RESET} ${WHITE}$CONTAINERS${RESET}"
echo -e "${YELLOW}🚨 Failed Logins Today:${RESET} ${WHITE}$FAILED_LOGINS${RESET}"
# Mensaje de bienvenida
echo -e "${CYAN}\n🚀 Welcome your SSH session is ready. 🛠${RESET}"
echo -e "${GREEN}💬 Quote:${RESET} ${WHITE}$RANDOM_MSG${RESET}"
