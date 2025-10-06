# 🗑️ remove_user.sh

A simple interactive Bash script to **safely remove a user** from an Ubuntu system.  
It will:  
- Kill all user processes  
- End active SSH/TTY sessions  
- Lock the account  
- Remove sudo/admin privileges  
- Delete the user and their home directory  
- Clean up leftover files (cron, mail, etc.)  

---

## 🔧 Usage

### 1) Download the script
```bash
curl -fsSL -o remove_user.sh https://raw.githubusercontent.com/ProTechEx/remove_user.sh/main/remove_user.sh
chmod +x remove_user.sh
sudo ./remove_user.sh
```


The script will ask you to **enter the username** to remove and perform the full cleanup.

---

## ⚠️ Warning
- This script **permanently deletes the user and their home directory**.  
- Double-check before proceeding.  
- Use with `sudo` privileges.  
