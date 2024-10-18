#!/bin/sh

set -eux
set -o pipefail

apk update

# Remove any existing PostgreSQL client to prevent conflicts
apk del postgresql-client || true

# Install pg_dump version 16
apk add postgresql16-client

# Install gpg
apk add gnupg

# Install aws-cli
apk add aws-cli

# Install go-cron
apk add curl
curl -L https://github.com/ivoronin/go-cron/releases/download/v0.0.5/go-cron_0.0.5_linux_${TARGETARCH}.tar.gz -O
tar xvf go-cron_0.0.5_linux_${TARGETARCH}.tar.gz
rm go-cron_0.0.5_linux_${TARGETARCH}.tar.gz
mv go-cron /usr/local/bin/go-cron
chmod u+x /usr/local/bin/go-cron
apk del curl

# Cleanup
rm -rf /var/cache/apk/*
