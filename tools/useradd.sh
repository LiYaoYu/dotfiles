#!/usr/bin/env bash

# Usage: useradd.sh <USER_NAME> <USER_PASSWORD>

useradd -d /home/$1 -m $2
passwd $2

echo "$1 ALL=(ALL) ALL" >> /etc/sudoers
