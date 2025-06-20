#!/bin/bash
sudo systemctl start postgresql.service
echo "postresql.service start"
sudo msfrpcd -U msf -P 1234 -S # change the username and password you set during the setup.

echo "Username: msf";
echo "Password: 1234"
echo "msfrpcd started"
export MSF_DATABASE_CONFIG="`ls ~/.msf4/database.yml`"

echo "variable export successfully";

echo "Starting the armitage"
sleep(2)
armitage