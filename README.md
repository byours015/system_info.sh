📊 System Information Script (Linux)
A simple, short Bash script that displays essential system information in a clean, readable format – perfect for beginners learning Linux commands or for quickly checking system status.

https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black
https://img.shields.io/badge/GNU%2520Bash-4EAA25?style=for-the-badge&logo=GNU%2520Bash&logoColor=white
https://img.shields.io/badge/License-MIT-green.svg

📖 Overview
This script does exactly what you would manually type into the terminal, but in one neat command:

✅ Displays Hostname – Shows your system's network name
✅ Shows OS Version – Ubuntu/Debian distribution info
✅ Kernel Version – Linux kernel details
✅ CPU Information – Processor model and specs
✅ RAM Total – Total system memory
✅ Disk Usage – Storage utilization percentage
✅ User List – Shows only root and human users (no system clutter)
✅ User Count – Total number of human users

The script is tiny, easy to understand, and perfect for beginners who want to see exactly what each command does.

📋 Prerequisites
Ubuntu or any Debian-based Linux distribution

No root/sudo required – script runs with regular user privileges

No extra packages – everything uses built-in commands (lsb_release, lscpu, free, df, awk, etc.)

🚀 How to Use (Quick Start)
Clone or download this script (save it as system_info.sh)

Make it executable

bash
chmod +x system_info.sh
Run it

bash
./system_info.sh
That's it – the script will display all system information in a clean, formatted output!

💻 The Script (Full Source)
bash
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
📚 Step-by-Step Explanation of Each Command
Command	What it does
#!/bin/bash	Shebang line – tells the system this is a Bash script
echo "====== SYSTEM INFO ======"	Prints a header to separate output sections
hostname	Shows the system's network hostname
lsb_release -ds	Displays OS distribution name and version (e.g., "Ubuntu 22.04.3 LTS")
uname -sr	Shows kernel release information (e.g., "Linux 5.15.0-91-generic")
lscpu | grep 'Model name'	Gets detailed CPU information and filters to the model name
cut -d':' -f2	Splits by colon : and takes the second field (the actual CPU name)
xargs	Trims extra whitespace from the CPU name
free -h	Shows memory usage in human-readable format (GB/MB)
grep Mem	Filters to only the memory (RAM) line
awk '{print $2}'	Prints the second column (total RAM) from the memory line
df -h /	Shows disk usage for the root partition in human-readable format
awk 'NR==2 {print $5}'	Gets line 2 (skips header) and prints column 5 (usage percentage)
awk -F':'	Uses colon : as field separator for parsing /etc/passwd
$1=="root" || $3>=1000	Shows root user (UID 0) OR users with UID >= 1000 (human users)
{print " → " $1}	Prints the username with an arrow for better formatting
sort	Sorts usernames alphabetically
wc -l	Counts the number of lines (users)
🎨 Sample Output
text
====== SYSTEM INFO ======
Hostname: my-ubuntu-server
OS: Ubuntu 22.04.3 LTS
Kernel: 5.15.0-91-generic

CPU: Intel(R) Core(TM) i7-8700K CPU @ 3.70GHz
RAM: 15.6G
Disk: 45%

USERS:
  → jenne
  → root
------
Total: 2 users
========================
🔧 Customization Options
Add More System Information
You can easily extend the script by adding these lines:

bash
# Add system uptime
echo "Uptime: $(uptime -p | sed 's/up //')"

# Add CPU cores
echo "CPU Cores: $(nproc)"

# Add IP address
echo "IP: $(hostname -I | awk '{print $1}')"

# Add logged-in users
echo "Logged-in: $(who | wc -l) users currently logged in"

# Add swap usage
echo "Swap: $(free -h | awk '/Swap:/ {print $3 "/" $2}')"
Advanced Filtering Options
bash
# Show ONLY human users (exclude root if you want)
awk -F':' '$3>=1000 {print "  → " $1}' /etc/passwd | sort

# Show users with their shells
awk -F':' '($1=="root" || $3>=1000) {print "  → " $1 " (" $7 ")"}' /etc/passwd | sort

# Show users with their home directories
awk -F':' '($1=="root" || $3>=1000) {print "  → " $1 " (home: " $6 ")"}' /etc/passwd | sort
🎯 Why This Script is Perfect for Beginners
Feature	Benefit
Short length	Only 13 lines – easy to understand and memorize
Common commands	Uses hostname, lscpu, df, etc. – all standard Linux tools
Clear output	Formatted with headers and arrows for readability
No root needed	Runs safely as a regular user
Self-documenting	Every command shows exactly what it does
Portable	Works on any Debian/Ubuntu system without extra packages
❓ Common Questions
Why don't I see system users like _apt, avahi, etc.?
The script filters out system users (UID 1-999) and only shows:

root (UID 0)

Human users (UID >= 1000)

This gives you a clean, non-cluttered output focused on the users that matter.

Why does the script use awk instead of cut?
awk is more powerful and flexible:

It can handle conditions (like $3>=1000)

It's more readable for complex parsing

It's standard on all Linux systems

Can I run this script without making it executable?
Yes! You can run it with:

bash
bash system_info.sh
Or even:

bash
sh system_info.sh
How do I save the output to a file?
bash
./system_info.sh > system_report.txt
Or to both see and save:

bash
./system_info.sh | tee system_report.txt
🗑️ Cleanup – There's Nothing to Remove
Since this script only reads system information and doesn't create or modify any files, there's nothing to clean up! It's completely safe to run.

📊 Comparison with Other System Info Tools
Feature	This Script	neofetch	screenfetch	htop
Size	13 lines	Large	Large	Large
Speed	Instant	0.5s	0.5s	0.5s
Dependencies	None	Many	Many	Many
Installation	Copy/paste	apt install	apt install	apt install
Beginner Friendly	⭐⭐⭐⭐⭐	⭐⭐⭐	⭐⭐⭐	⭐⭐
🌟 Related Scripts in This Repository
Script Name	Description
create_users.sh	Automates user and group creation with shared directories
network_test.sh	Tests connectivity to multiple websites
disk_alert.sh	Checks disk usage and warns if getting full
service_dashboard.sh	Shows status of common system services
health_monitor.sh	Complete system health check combining all modules
🤝 Contributing
Feel free to fork this repository and submit pull requests for:

Adding more system information

Improving formatting

Supporting more Linux distributions

Adding color coding

📝 License
This project is open source and available under the MIT License.

⭐ Show Your Support
If you found this script useful:

⭐ Star this repository on GitHub

📢 Share it with other Linux beginners

🐛 Report any issues you find

Made with ❤️ for Linux beginners everywhere

text
echo "========================"
🎯 Quick Reference Card
bash
# Most common Linux info commands used in this script

hostname              # System name
lsb_release -a        # Distribution info
uname -a              # Kernel info
lscpu                 # CPU details
free -h               # Memory usage
df -h                 # Disk usage
cat /etc/passwd       # User database
who                   # Logged in users
uptime                # System uptime
