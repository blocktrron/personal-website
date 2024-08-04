#!/bin/sh

# Install system configuration
rm -rf /etc/config
mkdir /etc/config
cp /usr/share/homepage-core/config/* /etc/config

# Set authorized-keys
cp /usr/share/homepage-core/contrib/authorized_keys /etc/dropbear/authorized_keys

# Copy sysctl.conf
cp /usr/share/homepage-core/contrib/sysctl.conf /etc/sysctl.conf

# Copy inittab
cp /usr/share/homepage-core/contrib/inittab /etc/inittab

# Lock root user
passwd -l root
