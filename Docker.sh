#!/bin/bash
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update
sudo apt-get install -y docker-ce

sudo usermod -aG docker ubuntu

cat <<EOF > index.html
This is my test page..
EOF

cat <<EOF > Dockerfile
FROM nginx:alpine
COPY index.html /usr/share/nginx/html
EOF
