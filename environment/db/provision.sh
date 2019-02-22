#!/bin/sh -e

apt-get update
apt-get -y upgrade
#
# apt-get -y install postgresql postgresql-contrib

sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" "/etc/postgresql/9.5/main/postgresql.conf"


echo "host    all             all             all                     md5" >> "/etc/postgresql/9.5/main/pg_hba.conf"
echo "host    all             all             ::/0                    md5" >> "/etc/postgresql/9.5/main/pg_hba.conf"


service postgresql restart

su - postgres -c "psql -U postgres -d postgres -c \"alter user postgres with password 'password';\""

cat << EOF | su - postgres -c psql

CREATE DATABASE attendance_tracker;

EOF

# seeding the database requires you to login into the database, look into a better way to seed the database instead of using a seed.sql file, rake?
# psql -h 192.168.10.150 -U postgres -d attendance_tracker
# type in 'password' for password
# \i /home/ubuntu/environment/seed.sql

# restart the service
# sudo systemctl restart postgresql
