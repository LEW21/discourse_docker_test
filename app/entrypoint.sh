#!/bin/bash
set -e

cd /pups
git pull
cat /app/conf.d/*.yaml | /pups/bin/pups --stdin

exec "$@"
