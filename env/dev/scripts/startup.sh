#!/bin/bash
apt update -y
apt install -y nginx
echo "Hello from DEV MIG" > /var/www/html/index.html
systemctl restart nginx
