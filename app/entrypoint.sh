#!/bin/bash
set -e

cd /pups
git pull
(for f in /app/conf.d/*; do cat $f; echo _FILE_SEPERATOR_; done; echo "noop:") | /pups/bin/pups --stdin

exec "$@"
