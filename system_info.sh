#!/bin/bash
# system_info.sh - Short version with clean user list

echo "====== SYSTEM INFO ======"
echo "Hostname: $(hostname)"
echo "OS: $(lsb_release -ds)"
echo "Kernel: $(uname -sr)"
echo ""
echo "CPU: $(lscpu | grep 'Model name' | cut -d':' -f2 | xargs)"
echo "RAM: $(free -h | grep Mem | awk '{print $2}')"
echo "Disk: $(df -h / | awk 'NR==2 {print $5}')"
echo ""
echo "USERS:"
awk -F':' '($1=="root" || $3>=1000) {print "  → " $1}' /etc/passwd | sort
echo "------"
echo "Total: $(awk -F':' '($1=="root" || $3>=1000)' /etc/passwd | wc -l) users"
echo "========================"