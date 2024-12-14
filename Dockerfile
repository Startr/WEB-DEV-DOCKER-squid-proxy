# Use Debian Bullseye as the base image
FROM debian:bullseye

# Install Squid proxy server
RUN apt-get update && \
    apt-get install -y squid && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create necessary directories
RUN mkdir -p /var/spool/squid && \
    mkdir -p /var/log/squid

# Copy the custom Squid configuration file and startup script
COPY squid.conf /etc/squid/squid.conf
COPY startup.sh /startup.sh

# Make startup script executable
RUN chmod +x /startup.sh

# Run startup script
CMD ["/startup.sh"]