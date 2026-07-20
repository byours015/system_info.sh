#!/bin/bash
# system_info.sh - Users with shell information

echo "====== SYSTEM INFORMATION ======"
echo "Hostname: $(hostname)"
echo "OS Version: $(lsb_release -d | cut -f2)"
echo "Kernel: $(uname -r)"
echo ""
echo "CPU: $(lscpu | grep 'Model name' | cut -d':' -f2 | xargs)"
echo "RAM Total: $(free -h | grep Mem | awk '{print $2}')"
echo "Disk Usage: $(df -h / | awk 'NR==2 {print $5}')"
echo ""
echo "USERS WITH LOGIN ACCESS:"
echo "---------------------"
# Show users with bash/sh shell (not nologin)
awk -F':' '($1=="root" || $3>=1000) && $7!="/usr/sbin/nologin" {print "  → " $1 " (" $7 ")"}' /etc/passwd | sort
echo "---------------------"
echo "Total login-capable users: $(awk -F':' '($1=="root" || $3>=1000) && $7!="/usr/sbin/nologin"' /etc/passwd | wc -l)"
echo "================================="