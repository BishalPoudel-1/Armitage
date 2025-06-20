#!/bin/bash

# ----------------------------
# Script: setup_armitage.sh
# Description Installs and configures Metasploit, PostgreSQL, and Armitage
# This is for the user with arch linux and have blackarch linux repo. only work for this type of users
# ----------------------------

echo "[*] Installing Armitage and dependencies..."
sudo pacman -Syu --noconfirm metasploit postgresql armitage  --needed

echo "[*] Changing ownership of /var/lib/postgres..."
sudo chown -R postgres:postgres /var/lib/postgres/

echo "[*] Initializing PostgreSQL database..."
sudo -i -u postgres bash << EOF
initdb --locale \$LANG -E UTF8 -D '/var/lib/postgres/data'
EOF

echo "[*] Starting PostgreSQL service..."
sudo systemctl start postgresql.service

# Prompt user for PostgreSQL credentials
read -p "Enter a PostgreSQL username to create: " DB_USER
read -s -p "Enter a password for user $DB_USER: " DB_PASS
echo
read -p "Enter a database name to create (e.g., metasploit4): " DB_NAME

echo "[*] Creating PostgreSQL user and database..."
sudo -u postgres createuser $DB_USER -W << EOF
$DB_PASS
$DB_PASS
EOF

sudo -u postgres createdb -O $DB_USER $DB_NAME

echo "[*] Starting Metasploit console to initialize DB..."
msfconsole -x "db_connect $DB_USER:$DB_PASS@$DB_NAME; db_rebuild_cache; exit"

echo "[*] Creating ~/.msf4/database.yml file..."
mkdir -p ~/.msf4
cat > ~/.msf4/database.yml << EOF
production:
  adapter: postgresql
  database: $DB_NAME
  username: $DB_USER
  password: $DB_PASS
  host: localhost
  port: 5432
  pool: 5
  timeout: 5
EOF

echo "[*] Setting MSF_DATABASE_CONFIG environment variable..."
export MSF_DATABASE_CONFIG="$(ls ~/.msf4/database.yml)"

# Prompt for msfrpcd credentials
read -p "Enter a username for msfrpcd (e.g., msf): " RPC_USER
read -s -p "Enter a password for $RPC_USER: " RPC_PASS
echo

echo "[*] Starting msfrpcd service manually for the first time..."
sudo msfrpcd -U $RPC_USER -P $RPC_PASS -S &

sleep 5

echo "[*] Launching Armitage..."
armitage
