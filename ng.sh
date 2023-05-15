#!/bin/bash

# Remove existing files if they exist
rm -rf ngrok ngrok.zip ng.sh >/dev/null 2>&1

echo "======================="
echo "Download ngrok"
echo "======================="

# Download ngrok
wget -O ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip >/dev/null 2>&1
unzip ngrok.zip >/dev/null 2>&1

echo "======================="
echo "Set Ngrok Authtoken"
echo "======================="

# Prompt user for Ngrok authtoken
read -p "Paste Ngrok Authtoken: " CRP

# Set Ngrok authtoken
./ngrok authtoken "$CRP"

