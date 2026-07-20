📊 System Information Script (Linux)
A simple, short Bash script that displays essential system information including hostname, OS, kernel, CPU, RAM, disk usage, and a clean list of users – perfect for beginners learning Linux or quickly checking system status.

https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black
https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white
https://img.shields.io/badge/License-MIT-green

📖 Overview
This script does exactly what you would manually type in the terminal, but in one go:

✅ Hostname – Shows your system's name
✅ OS Version – Displays the operating system details
✅ Kernel – Shows the Linux kernel version
✅ CPU Model – Displays your processor information
✅ RAM Total – Shows total system memory
✅ Disk Usage – Shows root partition usage percentage
✅ User List – Shows ONLY root and human users (not system users)

The script is tiny, easy to understand, and perfect for beginners who want to see exactly what each command does.

📋 Prerequisites
Ubuntu or any Debian-based Linux distribution (works on other distros with minor changes)

You must have read access to /etc/passwd (any user can read it)

No extra packages needed – everything uses built-in commands (hostname, lsb_release, uname, lscpu, free, df, awk)

🚀 How to Use (Quick Start)
Clone or download this script (save it as system_info.sh)

Make it executable:

bash
chmod +x system_info.sh
Run it (no sudo needed for basic info):

bash
./system_info.sh
OR run with sudo for full system details:

bash
sudo ./system_info.sh
That's it – the script will display your system information and print a clean user list!

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
1. System Information Commands
Command	What it does
#!/bin/bash	Tells the system to run this script with Bash interpreter
echo "====== SYSTEM INFO ======"	Prints a header to make output look clean
$(hostname)	Fetches the system's hostname (computer name)
$(lsb_release -ds)	Shows OS name and version (e.g., "Ubuntu 22.04.3 LTS")
$(uname -sr)	Displays kernel version (e.g., "5.15.0-91-generic")
2. CPU Information
Command	What it does
lscpu	Lists detailed CPU information
grep 'Model name'	Filters out the line containing CPU model
cut -d':' -f2	Splits by : and takes the 2nd field (the model name)
xargs	Removes extra spaces from the output
Example:
lscpu | grep 'Model name' → Model name: Intel(R) Core(TM) i7-8700K CPU @ 3.70GHz
After cut and xargs → Intel(R) Core(TM) i7-8700K CPU @ 3.70GHz

3. RAM Information
Command	What it does
free -h	Shows memory usage in human-readable format (MB/GB)
grep Mem	Filters the line containing RAM (not swap)
awk '{print $2}'	Prints the 2nd column (total RAM)
Example Output:
free -h → Mem: 15Gi 3.2Gi 11Gi 1.2Gi 4.5Gi 10Gi
After grep and awk → 15Gi

4. Disk Usage
Command	What it does
df -h /	Shows disk usage for root partition in human-readable format
awk 'NR==2 {print $5}'	Takes line 2 (skip header) and prints 5th column (usage percentage)
Example Output:
df -h / → /dev/sda1 50G 30G 20G 60% /
After awk → 60%

5. User List (The Magic Filter)
Command	What it does
awk -F':'	Use : as field separator (passwd file uses :)
$1=="root"	If username is "root", include it
||	OR operator
$3>=1000	If User ID (UID) is 1000 or higher, include it
{print " → " $1}	Print arrow symbol + username
/etc/passwd	Read user database file
sort	Arrange usernames alphabetically
Why This Works:

System users have UIDs 1-999 (e.g., _apt, avahi, backup)

Human users have UIDs 1000-60000 (e.g., root has UID 0)

root is always included (UID 0) for security reasons

Example Filter Process:

text
/etc/passwd contains:
root:x:0:0:root:/root:/bin/bash          → root (UID 0) → YES (root rule)
jenne:x:1000:1000:jenne:/home/jenne:/bin/bash → jenne (UID 1000) → YES (>=1000)
_apt:x:42:42::/nonexistent:/usr/sbin/nologin → _apt (UID 42) → NO (not root, <1000)
avahi:x:106:108:Avahi mDNS user:/run/avahi-daemon:/usr/sbin/nologin → avahi (UID 106) → NO
Final Output:

text
USERS:
  → jenne
  → root
------
Total: 2 users
📊 Example Output
When you run the script, you'll see something like this:

bash
====== SYSTEM INFO ======
Hostname: my-ubuntu-server
OS: Ubuntu 22.04.3 LTS
Kernel: 5.15.0-91-generic

CPU: Intel(R) Core(TM) i7-8700K CPU @ 3.70GHz
RAM: 15Gi
Disk: 45%

USERS:
  → jenne
  → root
------
Total: 2 users
========================
🎯 Why This Script is Perfect for Beginners
1. No Complex Logic
Just simple commands chained together

Each line does ONE thing

2. Teaches Core Linux Commands
You learn hostname, lsb_release, uname, lscpu, free, df

You learn piping (|) and command substitution ($(command))

You learn AWK for text processing

3. Clean Output
Shows only what matters

No clutter from system users

4. Modular
Easy to add/remove sections

You can customize what info to show

⭐ If you found this script useful, consider giving it a Star!
📄 License
This project is licensed under the MIT License - see the LICENSE file for details.
