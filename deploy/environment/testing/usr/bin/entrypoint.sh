#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

composer install -q -n

# Start code quality suite
exec