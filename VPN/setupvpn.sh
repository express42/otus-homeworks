#!/bin/bash

# ADD REPO
sudo tee /etc/apt/sources.list.d/pritunl.list << EOF
deb http://repo.pritunl.com/stable/apt focal main
EOF

sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list << EOF
deb https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse
EOF

# ADD KEY
curl https://raw.githubusercontent.com/pritunl/pgp/master/pritunl_repo_pub.asc | sudo apt-key add -
curl https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -

# UPDATE
sudo apt update

# DISABLE FIREWALL
sudo ufw disable

# INSTALL VPN
sudo apt -y install pritunl mongodb-org
sudo systemctl enable mongod pritunl
sudo systemctl start mongod pritunl
