#!/bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt install curl wget net-tools -y

if command -v git &>/dev/null; then
    echo "Git is already installed..."
else
    sudo apt install git -y
fi

if dpkg -l | grep -q "postgresql"; then
  echo "PostgreSQL is already installed..."
else
  sudo apt install postgresql postgresql-contrib -y

  # Install PostgreSQL and PostgreSQL-contrib
  sudo apt install -y postgresql postgresql-contrib

  # Initialize the database cluster
  sudo pg_createcluster 13 main --start

  # Prompt the user to set a password for the "postgres" user
  read -p "Enter a password for the PostgreSQL 'postgres' user: " postgres_password

  # Set the password for the PostgreSQL user "postgres"
  sudo -u postgres psql -c "ALTER USER postgres PASSWORD '$postgres_password';"

  # Start and enable PostgreSQL service
  sudo systemctl start postgresql
  sudo systemctl enable postgresql
fi

sudo apt install neovim -y