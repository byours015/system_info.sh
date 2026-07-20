📊 System Info Script
A super simple Bash script that shows your system details in a clean, colorful format.

https://img.shields.io/badge/Linux-FCC624?style=flat-square&logo=linux&logoColor=black
https://img.shields.io/badge/Bash-4EAA25?style=flat-square&logo=gnubash&logoColor=white

📖 What It Does
One script that shows:

🖥️ Hostname

💿 OS & Kernel

🔥 CPU Model

🧠 RAM Total

💾 Disk Usage

👤 Users (root + human users only)

No clutter – just the info you actually care about!

🚀 Quick Start
bash
# 1. Save the script
nano system_info.sh

# 2. Copy the script below

# 3. Make it executable
chmod +x system_info.sh

# 4. Run it
./system_info.sh
That's it! Your system info appears instantly.

💻 The Script
bash
#!/bin/bash

echo "==================================="
echo "         SYSTEM INFO               "
echo "==================================="
echo ""
echo "🖥️  Hostname : $(hostname)"
echo "💿  OS       : $(lsb_release -ds)"
echo "🔧  Kernel   : $(uname -sr)"
echo "🔥  CPU      : $(lscpu | grep 'Model name' | cut -d':' -f2 | xargs)"
echo "🧠  RAM      : $(free -h | grep Mem | awk '{print $2}')"
echo "💾  Disk     : $(df -h / | awk 'NR==2 {print $5}')"
echo ""
echo "👤  Users:"
awk -F':' '($1=="root" || $3>=1000) {print "    ➜ " $1}' /etc/passwd | sort
echo "    ------------------------"
echo "    Total: $(awk -F':' '($1=="root" || $3>=1000)' /etc/passwd | wc -l) users"
echo "==================================="
📸 Sample Output
text
===================================
         SYSTEM INFO               
===================================

🖥️  Hostname : ubuntu-server
💿  OS       : Ubuntu 22.04.3 LTS
🔧  Kernel   : 5.15.0-91-generic
🔥  CPU      : Intel(R) Core(TM) i7-8700K CPU @ 3.70GHz
🧠  RAM      : 15Gi
💾  Disk     : 45%

👤  Users:
    ➜ jenne
    ➜ root
    ------------------------
    Total: 2 users
===================================
📚 Command Breakdown
Command	What it shows
hostname	Your computer name
lsb_release -ds	OS name & version
uname -sr	Kernel version
lscpu | grep ...	CPU model
free -h | grep Mem	Total RAM
df -h /	Disk usage %
awk ... /etc/passwd	User list (root + humans only)
Why only root + human users?
User Type	UID Range	Example
System users	1-999	_apt, avahi, backup ❌
Human users	1000+	jenne, john ✅
Root	0	root ✅
The script filters out system users so you only see what matters!

🎨 Make It Colorful
Add colors to make it pop!

bash
#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}===================================${NC}"
echo -e "${GREEN}         SYSTEM INFO               ${NC}"
echo -e "${BLUE}===================================${NC}"
echo ""
echo -e "${GREEN}🖥️  Hostname${NC} : $(hostname)"
echo -e "${GREEN}💿  OS${NC}       : $(lsb_release -ds)"
echo -e "${GREEN}🔧  Kernel${NC}   : $(uname -sr)"
echo -e "${GREEN}🔥  CPU${NC}      : $(lscpu | grep 'Model name' | cut -d':' -f2 | xargs)"
echo -e "${GREEN}🧠  RAM${NC}      : $(free -h | grep Mem | awk '{print $2}')"
echo -e "${GREEN}💾  Disk${NC}     : $(df -h / | awk 'NR==2 {print $5}')"
echo ""
echo -e "${YELLOW}👤  Users:${NC}"
awk -F':' '($1=="root" || $3>=1000) {print "    ➜ " $1}' /etc/passwd | sort
echo -e "${YELLOW}    ------------------------${NC}"
echo -e "${YELLOW}    Total:${NC} $(awk -F':' '($1=="root" || $3>=1000)' /etc/passwd | wc -l) users"
echo -e "${BLUE}===================================${NC}"
🔧 Customize It
Add more info
bash
echo "⏰  Uptime   : $(uptime -p | sed 's/up //')"
echo "📡  IP       : $(hostname -I | awk '{print $1}')"
echo "👥  Logged in: $(who | wc -l) users"
Save output to file
bash
./system_info.sh > system_report.txt
View output AND save it
bash
./system_info.sh | tee system_report.txt
📝 Troubleshooting
Issue	Fix
lsb_release: command not found	sudo apt install lsb-release
Permission denied	chmod +x system_info.sh
Shows system users	Change 1000 to 2000 in the awk command
No users shown	Check your UID with id -u
⭐ Love this script? Star it! ⭐
Made with ❤️ for Linux beginners
