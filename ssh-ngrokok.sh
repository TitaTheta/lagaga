#!/bin/bash
rm -rf ngrok ngrok.zip ngrok.sh >/dev/null 2>&1
wget -O https://github.com/TitaTheta/lagaga/blob/main/ng.sh >/dev/null 2>&1
chmod +x ng.sh
./ng.sh
clear
echo "======================="
echo "Choose ngrok region"
echo "======================="
echo "us - United States (Ohio)"
echo "eu - Europe (Frankfurt)"
echo "ap - Asia/Pacific (Singapore)"
echo "au - Australia (Sydney)"
echo "sa - South America (Sao Paulo)"
echo "jp - Japan (Tokyo)"
echo "in - India (Mumbai)"
read -p "Choose ngrok region: " CRP
./ngrok tcp --region "$CRP" 22 >/dev/null &
echo "======================="
echo "Updating Please Wait"
echo "======================="
sudo apt update >/dev/null 2>&1
sudo apt install -y openssh-server >/dev/null 2>&1
sudo mkdir -p /var/run/sshd
echo "PermitRootLogin yes" | sudo tee -a /etc/ssh/sshd_config >/dev/null
echo "PasswordAuthentication yes" | sudo tee -a /etc/ssh/sshd_config >/dev/null
echo "LD_LIBRARY_PATH=/usr/lib64-nvidia" >>/root/.bashrc
echo "export LD_LIBRARY_PATH" >>/root/.bashrc
sudo service ssh start
echo "===================================="
PUBLIC_URL=$(curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p')
echo "Ngrok tunnel URL: $PUBLIC_URL"
echo "Create root password"
passwd

echo "===================================="
