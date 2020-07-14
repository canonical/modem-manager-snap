#!/bin/bash -ex

# shellcheck source=tests/lib/snap-names.sh
. "$TESTSLIB"/snap-names.sh

# Remove all snaps not being the core, gadget, kernel or snap we're testing
for snap in /snap/*; do
	snap="${snap:6}"
	case "$snap" in
		README | bin | "$gadget_name" | "$kernel_name" | core* | snapd | "$SNAP_NAME")
			;;
		*)
			snap remove "$snap"
			;;
	esac
done

# Cleanup all configuration files from ModemManager so that we have
# a fresh start for the next test
systemctl stop snap.modem-manager.modemmanager
rm -rf /var/snap/modem-manager/common/*
rm -rf /var/snap/modem-manager/current/*

# Bringup ModemManager again now that the system is restored
systemctl start snap.modem-manager.modemmanager
