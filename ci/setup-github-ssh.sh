#!/usr/bin/env bash
#Decrypt ssh key
openssl aes-256-cbc -K $encrypted_df2bd5da7d4c_key -iv $encrypted_df2bd5da7d4c_iv -in ci/deploy_rsa.enc -out ~/.ssh/deploy_rsa -d

# Change key permission
chmod 400 ~/.ssh/deploy_rsa

# Setup ssh config to use ssh key
echo -e "Host github.com\n\tHostName github.com\n\tUser git\n\tIdentityFile ~/.ssh/deploy_rsa\n" >> ~/.ssh/config
