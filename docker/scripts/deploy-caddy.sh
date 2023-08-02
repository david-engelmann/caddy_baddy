#!/usr/bin/env bash
set -e

VOLUME="$HOME/sourcegraph-docker/caddy-storage"
./ensure-volume.sh $VOLUME 100
docker run --detach \
    --name=caddy \
    --network=sourcegraph \
    --restart=always \
    --cpus="4" \
    --memory=4g \
    -e XDG_DATA_HOME="/caddy-storage/data" \
    -e XDG_CONFIG_HOME="/caddy-storage/config" \
    -e SRC_FRONTEND_ADDRESSES="sourcegraph-frontend-0:3080" \
    -p 0.0.0.0:80:80 \
    -p 0.0.0.0:443:443 \
    -v $VOLUME:/caddy-storage \
    --mount type=bind,source="$(pwd)"/../caddy/builtins/http.Caddyfile,target=/etc/caddy/Caddyfile \
    index.docker.io/caddy:2.5.2-alpine@sha256:cfa7d94aa1f0c68a167b147a8573711283df2cd6fc285d220387f20206ff4874
