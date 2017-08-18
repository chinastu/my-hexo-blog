#!/bin/bash
# Decrypt the private key
openssl aes-256-cbc -K $encrypted_c9744fe6174f_key -iv $encrypted_c9744fe6174f_iv -in .travis/id_rsa.enc -out ~/.ssh/id_rsa -d

# Set the permission of the key
chmod 600 ~/.ssh/id_rsa

# Start SSH agent
eval $(ssh-agent)

# Add the private key to the system
ssh-add ~/.ssh/id_rsa

# Copy SSH config
# cp .travis/ssh_config ~/.ssh/config

# Set Git config
git config --global user.name "凡梦星尘"
git config --global user.email elkan1788@gmail.com

# Deploy to GitHub
hexo deploy
