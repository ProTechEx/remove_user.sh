#!/bin/bash
# Interactive User Removal Script for Ubuntu
# It asks for the username, then deletes user, home, privileges, processes, etc.

read -p "Enter the username to remove: " USER

if [ -z "$USER" ]; then
    echo "[-] No username entered. Exiting."
    exit 1
fi

# Check if user exists
if id "$USER" &>/dev/null; then
    echo "[+] Terminating processes for user: $USER"
    sudo pkill -u "$USER"

    echo "[+] Ending active sessions"
    sudo loginctl terminate-user "$USER" 2>/dev/null

    echo "[+] Locking account"
    sudo usermod -L "$USER"

    echo "[+] Removing from sudo/admin groups if present"
    sudo gpasswd -d "$USER" sudo 2>/dev/null
    sudo deluser "$USER" sudo 2>/dev/null

    echo "[+] Deleting user and home directory"
    sudo deluser --remove-home "$USER"

    echo "[+] Removing all leftover files (cron, mail, etc.)"
    sudo deluser --remove-all-files "$USER"

    echo "[✓] Cleanup complete for user: $USER"
else
    echo "[-] User '$USER' does not exist."
fi
