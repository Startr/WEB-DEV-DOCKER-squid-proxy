#!/bin/bash

# Initialize Squid cache if it doesn't exist
if [ ! -d /var/spool/squid/00 ]; then
    echo "Initializing Squid cache..."
    squid -z -f /etc/squid/squid.conf
    
    # Wait for cache initialization to complete
    while [ ! -d /var/spool/squid/00 ]; do
        echo "Waiting for cache initialization..."
        sleep 1
    done
    
    # Additional wait to ensure all cache directories are ready
    sleep 2
fi

# Start Squid in non-daemon mode
echo "Starting Squid..."
exec squid -N -f /etc/squid/squid.conf