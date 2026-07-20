# 🖥️ System Information Script (Linux)

A lightweight Bash script that displays essential Linux system information in a clean and readable format. It is perfect for beginners learning Bash scripting, Linux administrators, and anyone who wants a quick overview of their system.

---

## 📌 Features

This script automatically displays:

- ✅ Hostname
- ✅ Operating System
- ✅ Kernel Version
- ✅ CPU Model
- ✅ Total RAM
- ✅ Root Filesystem Disk Usage
- ✅ List of Local Users
- ✅ Total Number of Users

---

## 📖 Overview

Instead of running multiple Linux commands manually, this script collects the most useful system information and displays it in one place.

It gathers information such as:

- Computer hostname
- Linux distribution
- Running kernel version
- Processor model
- Installed memory
- Disk usage percentage
- Local user accounts
- Total number of users

The output is simple, clean, and easy to understand.

---

## 📋 Prerequisites

- Ubuntu or any Debian-based Linux distribution
- Bash Shell
- `lsb_release` package (installed by default on Ubuntu)
- No root privileges required

### Commands Used

- `hostname`
- `lsb_release`
- `uname`
- `lscpu`
- `free`
- `df`
- `awk`
- `grep`
- `cut`
- `sort`
- `wc`

---

# 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/system-info.git
cd system-info
```

### 2. Make the Script Executable

```bash
chmod +x system_info.sh
```

### 3. Run the Script

```bash
./system_info.sh
```

or

```bash
bash system_info.sh
```

---

# 💻 Script Source

```bash
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
```

---

# 📚 Command Explanation

| Command | Description |
|----------|-------------|
| `hostname` | Displays the system hostname. |
| `lsb_release -ds` | Shows the Linux distribution name. |
| `uname -sr` | Displays the kernel name and version. |
| `lscpu` | Displays CPU information. |
| `grep 'Model name'` | Extracts only the CPU model. |
| `cut -d':' -f2` | Removes everything before the colon. |
| `xargs` | Removes leading and trailing spaces. |
| `free -h` | Shows memory usage in a human-readable format. |
| `grep Mem` | Selects the memory line. |
| `awk '{print $2}'` | Prints the total installed RAM. |
| `df -h /` | Displays root filesystem disk usage. |
| `awk 'NR==2 {print $5}'` | Displays disk usage percentage. |
| `awk -F':'` | Reads `/etc/passwd` and filters user accounts. |
| `sort` | Sorts usernames alphabetically. |
| `wc -l` | Counts the total number of users. |

---

# 📂 Files Used

| File | Purpose |
|------|---------|
| `/etc/passwd` | Contains local user account information. |
| `/` | Used to calculate root filesystem disk usage. |

---

# 🖥️ Example Output

```text
====== SYSTEM INFO ======

Hostname: ubuntu-server
OS: Ubuntu 24.04 LTS
Kernel: Linux 6.8.0-31-generic

CPU: Intel(R) Core(TM) i5-1135G7
RAM: 8.0Gi
Disk: 34%

USERS:
  → root
  → ubuntu
  → bob

------
Total: 3 users
```

---

# ✅ Verify the Output

### Hostname

```bash
hostname
```

### Operating System

```bash
lsb_release -ds
```

### Kernel Version

```bash
uname -sr
```

### CPU

```bash
lscpu
```

### Memory

```bash
free -h
```

### Disk Usage

```bash
df -h /
```

### Users

```bash
awk -F':' '($1=="root" || $3>=1000) {print $1}' /etc/passwd
```

---

# 📖 What You'll Learn

By studying this project, you'll learn how to use:

- Bash Scripting
- Command Substitution (`$(...)`)
- Pipelines (`|`)
- `hostname`
- `uname`
- `lsb_release`
- `lscpu`
- `free`
- `df`
- `grep`
- `awk`
- `cut`
- `sort`
- `wc`

---

# 🎯 Why This Project?

- Beginner-friendly
- No external dependencies
- Easy to understand
- Useful for Linux administration
- Demonstrates combining multiple Linux commands into a single Bash script
- Great project for GitHub portfolios

---

## ⭐ Show Your Support

If you found this project helpful, consider giving it a **⭐ Star** on GitHub!

---
