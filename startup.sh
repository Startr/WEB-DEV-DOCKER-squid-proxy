#!/bin/bash

# Initialize Squid cache if it doesn't exist
if [ ! -d /var/spool/squid/00 ]; then
    echo "Initializing Squid cache..."
    squid -z -f /etc/squid/squid.conf
fi

# Start Squid in non-daemon mode
echo "Starting Squid..."
exec squid -N -f /etc/squid/squid.conf