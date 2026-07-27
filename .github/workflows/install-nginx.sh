#!/bin/bash

echo "Updating packages..."
sudo apt update

echo "Installing NGINX..."
sudo apt install -y nginx

echo "NGINX Version:"
nginx -v
