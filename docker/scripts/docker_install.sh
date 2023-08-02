#!/bin/bash
apt-get update -qq
apt-get install apt-transport-https ca-certificates gnupg lsb-release git curl iputils-ping debian-keyring debian-archive-keyring -y
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | tee /etc/apt/sources.list.d/caddy-stable.list
apt-get update -qq
apt-get install caddy -y
curl -fsSL https://get.docker.com -o get-docker.sh
sh ./get-docker.sh
exec "$@"
