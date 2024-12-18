#!/bin/bash

# Create directory structure
echo "Creating directory structure..."
mkdir -p manjaro-scripts/{system-monitoring,security-privacy,backup-restore,app-setup,system-optimization,development-setup,network-configuration,system-information,user-management,custom-aliases,automation-scheduling,utilities,system-recovery}

# System Monitoring Scripts
echo "Creating system monitoring scripts..."
cat <<EOT > manjaro-scripts/system-monitoring/cpu-monitor.sh
#!/bin/bash
while true; do
  echo "CPU Usage: \$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - \$1"%"}')"
  sleep 5
done
EOT

cat <<EOT > manjaro-scripts/system-monitoring/disk-space-checker.sh
#!/bin/bash
THRESHOLD=80

df -H | awk '{ print \$5 " " \$1 }' | while read output; do
  usage=\$(echo \$output | awk '{ print \$1}' | sed 's/%//g')
  partition=\$(echo \$output | awk '{ print \$2 }')

  if [ \$usage -ge \$THRESHOLD ]; then
    echo "Warning: High disk usage on \$partition (\$usage%)"
  fi
done
EOT

cat <<EOT > manjaro-scripts/system-monitoring/memory-monitor.sh
#!/bin/bash
while true; do
  free -h | awk '/^Mem/ {print "Memory Usage: " \$3 " / " \$2}'
  sleep 5
done
EOT

# Security and Privacy Scripts
echo "Creating security and privacy scripts..."
cat <<EOT > manjaro-scripts/security-privacy/setup-firewall.sh
#!/bin/bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw enable
echo "Firewall is enabled and SSH is allowed."
EOT

cat <<EOT > manjaro-scripts/security-privacy/ssh-keygen.sh
#!/bin/bash
read -p "Enter your email: " email
ssh-keygen -t rsa -b 4096 -C "\$email"
echo "SSH key generated. You can add it to your GitHub/GitLab account."
EOT

cat <<EOT > manjaro-scripts/security-privacy/secure-erase.sh
#!/bin/bash
if [ -z "\$1" ]; then
  echo "Usage: \$0 filename"
  exit 1
fi

shred -u -v "\$1"
echo "File \$1 securely erased."
EOT

# Backup and Restore Scripts
echo "Creating backup and restore scripts..."
cat <<EOT > manjaro-scripts/backup-restore/full-system-backup.sh
#!/bin/bash
DESTINATION="/path/to/backup/location"
EXCLUDES="--exclude=/proc --exclude=/tmp --exclude=/mnt --exclude=/dev --exclude=/sys"

sudo rsync -aAXv \$EXCLUDES / \$DESTINATION
echo "Backup completed."
EOT

cat <<EOT > manjaro-scripts/backup-restore/home-sync.sh
#!/bin/bash
DESTINATION="/mnt/backup/home"
rsync -av --delete ~/ \$DESTINATION
echo "Home directory synced with \$DESTINATION."
EOT

cat <<EOT > manjaro-scripts/backup-restore/restore-system.sh
#!/bin/bash
SOURCE="/path/to/backup/location"
sudo rsync -aAXv \$SOURCE/ /
echo "System restore completed."
EOT

# Custom Application Setups
echo "Creating custom application setup scripts..."
cat <<EOT > manjaro-scripts/app-setup/install-lamp.sh
#!/bin/bash
sudo pacman -S apache mariadb php php-apache
sudo systemctl start httpd
sudo systemctl enable httpd
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo systemctl start mariadb
sudo systemctl enable mariadb
echo "LAMP stack installed and services started."
EOT

cat <<EOT > manjaro-scripts/app-setup/install-docker.sh
#!/bin/bash
sudo pacman -S docker
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker \$USER
echo "Docker installed. Log out and back in to use Docker without sudo."
EOT

cat <<EOT > manjaro-scripts/app-setup/install-gaming-tools.sh
#!/bin/bash
sudo pacman -S steam lutris wine
echo "Gaming tools installed: Steam, Lutris, Wine."
EOT

# System Optimization Scripts
echo "Creating system optimization scripts..."
cat <<EOT > manjaro-scripts/system-optimization/power-management.sh
#!/bin/bash
sudo pacman -S tlp
sudo systemctl enable tlp
sudo systemctl start tlp
echo "TLP installed and enabled for power management."
EOT

cat <<EOT > manjaro-scripts/system-optimization/cleanup-packages.sh
#!/bin/bash
sudo pacman -Rns \$(pacman -Qdtq)
echo "Orphaned packages removed."
EOT

cat <<EOT > manjaro-scripts/system-optimization/update-kernel.sh
#!/bin/bash
sudo pacman -Syu
echo "System and kernel updated."
EOT

# Development Environment Setup
echo "Creating development environment setup scripts..."
cat <<EOT > manjaro-scripts/development-setup/python-env-setup.sh
#!/bin/bash
curl https://pyenv.run | bash
export PATH="\$HOME/.pyenv/bin:\$PATH"
eval "\$(pyenv init --path)"
eval "\$(pyenv init -)"
eval "\$(pyenv virtualenv-init -)"
pyenv install 3.10.5
pyenv global 3.10.5
pip install --user pipenv
echo "Python environment set up with pyenv and pipenv."
EOT

cat <<EOT > manjaro-scripts/development-setup/nodejs-setup.sh
#!/bin/bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="\$HOME/.nvm"
[ -s "\$NVM_DIR/nvm.sh" ] && \. "\$NVM_DIR/nvm.sh"
nvm install node
mkdir my-node-project
cd my-node-project
npm init -y
echo "Node.js installed and basic project initialized."
EOT

cat <<EOT > manjaro-scripts/development-setup/go-setup.sh
#!/bin/bash
sudo pacman -S go
mkdir -p ~/go/{bin,src,pkg}
echo "export GOPATH=\$HOME/go" >> ~/.bashrc
echo "Go installed and GOPATH set up."
EOT

# Network Configuration Scripts
echo "Creating network configuration scripts..."
cat <<EOT > manjaro-scripts/network-configuration/wifi-troubleshoot.sh
#!/bin/bash
sudo systemctl restart NetworkManager
nmcli device wifi rescan
echo "Wi-Fi troubleshooted. Rescanned for available networks."
EOT

cat <<EOT > manjaro-scripts/network-configuration/network-performance-test.sh
#!/bin/bash
sudo pacman -S iperf3
iperf3 -s &
iperf3 -c 192.168.1.1  # Replace with your router's IP address
ping -c 4 google.com
echo "Network performance test completed."
EOT

cat <<EOT > manjaro-scripts/network-configuration/setup-dns.sh
#!/bin/bash
sudo bash -c 'echo "nameserver 1.1.1.1" > /etc/resolv.conf'
sudo bash -c 'echo "nameserver 8.8.8.8" >> /etc/resolv.conf'
echo "Custom DNS set to Cloudflare and Google DNS."
EOT

# System Information Scripts
echo "Creating system information scripts..."
cat <<EOT > manjaro-scripts/system-information/hardware-info.sh
#!/bin/bash
sudo pacman -S inxi
inxi -Fxz
echo "Hardware information displayed."
EOT

cat <<EOT > manjaro-scripts/system-information/system-summary.sh
#!/bin/bash
echo "System Information:"
uname -a

echo "Memory Usage:"
free -h

echo "Disk Usage:"
df -h

echo "Installed Packages:"
pacman -Q | wc -l

echo "Uptime:"
uptime -p

echo "System summary generated."
EOT

# User Management Scripts
echo "Creating user management scripts..."
cat <<EOT > manjaro-scripts/user-management/user-management.sh
#!/bin/bash
if [ "\$1" == "add" ]; then
  sudo useradd -m \$2
  sudo passwd \$2
  echo "User \$2 added."
elif [ "\$1" == "remove" ]; then
  sudo userdel -r \$2
  echo "User \$2 removed."
else
  echo "Usage: \$0 {add|remove} username"
fi
EOT

cat <<EOT > manjaro-scripts/user-management/password-management.sh
#!/bin/bash
if [ -z "\$1" ]; then
  echo "Usage: \$0 username"
  exit 1
fi

sudo passwd \$1
echo "Password for user \$1 reset."
EOT

# Custom Aliases and Shortcuts
echo "Creating custom aliases and shortcuts..."
cat <<EOT > manjaro-scripts/custom-aliases/setup-aliases.sh
#!/bin/bash
cat <<EOF >> ~/.bashrc
alias ll='ls -la'
alias gs='git status'
alias gc='git commit -m'
EOF
source ~/.bashrc
echo "Aliases set up."
EOT

cat <<EOT > manjaro-scripts/custom-aliases/setup-prompt.sh
#!/bin/bash
cat <<EOF >> ~/.bashrc
PS1='\[\e[1;34m\]\u@\h:\[\e[1;32m\]\w\[\e[0m\]\$ '
EOF
source ~/.bashrc
echo "Bash prompt customized."
EOT

# Automation and Scheduling
echo "Creating automation and scheduling scripts..."
cat <<EOT > manjaro-scripts/automation-scheduling/cron-setup.sh
#!/bin/bash
if [ "\$1" == "add" ]; then
  crontab -l > mycron
  echo "\$2 \$3" >> mycron
  crontab mycron
  rm mycron
  echo "Cron job added."
elif [ "\$1" == "list" ]; then
  crontab -l
elif [ "\$1" == "remove" ]; then
  crontab -l | grep -v "\$2" > mycron
  crontab mycron
  rm mycron
  echo "Cron job removed."
else
  echo "Usage: \$0 {add|list|remove} [cron-job] [schedule]"
fi
EOT

cat <<EOT > manjaro-scripts/automation-scheduling/auto-update.sh
#!/bin/bash
sudo pacman -Syu --noconfirm
echo "System updated automatically."
EOT

# Utilities
echo "Creating utility scripts..."
cat <<EOT > manjaro-scripts/utilities/log-rotation.sh
#!/bin/bash
LOG_DIR="/var/log/myapp"
ARCHIVE_DIR="/var/log/myapp/archive"

mkdir -p \$ARCHIVE_DIR
find \$LOG_DIR -type f -name "*.log" -exec mv {} \$ARCHIVE_DIR \;
gzip \$ARCHIVE_DIR/*.log
echo "Log files rotated and archived."
EOT

cat <<EOT > manjaro-scripts/utilities/temp-cleaner.sh
#!/bin/bash
sudo pacman -S bleachbit
sudo bleachbit --clean system.cache system.tmp
echo "Temporary files and cache cleaned."
EOT

# System Recovery
echo "Creating system recovery scripts..."
cat <<EOT > manjaro-scripts/system-recovery/boot-repair.sh
#!/bin/bash
sudo mount /dev/sda1 /mnt  # Replace with your root partition
sudo mount --bind /dev /mnt/dev
sudo mount --bind /proc /mnt/proc
sudo mount --bind /sys /mnt/sys
sudo chroot /mnt
grub-install /dev/sda  # Replace with your disk
update-grub
exit
sudo umount /mnt/dev /mnt/proc /mnt/sys
echo "GRUB bootloader repaired."
EOT

cat <<EOT > manjaro-scripts/system-recovery/rescue-mode.sh
#!/bin/bash
echo "Entering rescue mode..."
bash --norc
EOT

# Make all scripts executable
echo "Making scripts executable..."
chmod +x manjaro-scripts/**/*.sh

echo "All files and directories created successfully."
