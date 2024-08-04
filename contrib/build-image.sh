#!/bin/bash

REMOVE_PKGS="\
	-dnsmasq \
	-firewall4 \
	-nftables \
	-odhcpd-ipv6only \
	-ppp \
	-ppp-mod-pppoe \
	-uboot-envtools \
	-wpad-basic-mbedtls \
	-kmod-amazon-ena \
	-kmod-amd-xgbe \
	-kmod-bnx2 \
	-kmod-dwmac-intel \
	-kmod-e1000e \
	-kmod-e1000 \
	-kmod-forcedeth \
	-kmod-fs-vfat \
	-kmod-nft-offload \
	-kmod-button-hotplug \
	-kmod-igb \
	-kmod-igc \
	-kmod-ixgbe \
	-kmod-r8169 \
	-kmod-tg3 \
	-procd-seccomp \
	-procd-ujail \
	-urandom-seed \
	-urngd \
"


EXTRA_PKGS="\
	homepage-core \
	homepage-content \
	uhttpd \
"

make image PROFILE="generic" PACKAGES="$REMOVE_PKGS $EXTRA_PKGS"