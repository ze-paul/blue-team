echo "[+] Installing Fail2ban"
sudo apt update
sudo apt install fail2ban -y
echo "[+] Fail2ban Installed"

echo "[+] Configuring fail2ban"
sudo touch /etc/fail2ban/jail.local
echo "[sshd]" | sudo tee -a  /etc/fail2ban/jail.local
echo "ignoreip = 127.0.0.1/8 143.244.125.213" | sudo tee -a /etc/fail2ban/jail.local
echo "enabled = true" | sudo tee -a /etc/fail2ban/jail.local
echo "banaction = iptables-multiport" |sudo tee -a /etc/fail2ban/jail.local
echo "maxretry = 10" | sudo tee -a /etc/fail2ban/jail.local
echo "findtime = 600" | sudo tee -a /etc/fail2ban/jail.local
echo "bantime = 300" | sudo tee -a /etc/fail2ban/jail.local
echo "Configuration Complete"

sudo systemctl enable fail2ban
sudo systemctl restart fail2ban
echo "[+] Fail2ban Up and Running"