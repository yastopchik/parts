#!/bin/sh
service cron start

set -e

## set host.docker.internal to hosts file for xdebug reasons
HOST_DOMAIN="host.docker.internal"
if ! ping -q -c1 $HOST_DOMAIN > /dev/null 2>&1
then
  HOST_IP=$(ip route | awk 'NR==1 {print $3}')
  # shellcheck disable=SC2039
  echo "$HOST_IP\t$HOST_DOMAIN" >> /etc/hosts
fi

## add ssh files
if [ ! -d "~/.ssh" ]
then
    mkdir ~/.ssh || echo 'Directory exists'
fi
cat /run/secrets/host_ssh_key > ~/.ssh/id_rsa
chmod 400 ~/.ssh/id_rsa

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- php-fpm "$@"
fi

exec "$@"
