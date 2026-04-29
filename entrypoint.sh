#!/bin/sh

find /usr/lib/dovecot/sieve/ -name "*.sieve" -exec sievec {} \;

exec "$@"
