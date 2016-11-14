#!/bin/sh

wait_for_modem_manager() {
	while ! systemctl status snap.modem-manager.modemmanager ; do
		sleep 1
	done
	sleep 1
}

stop_after_first_reboot() {
	if [ $SPREAD_REBOOT -eq 1 ] ; then
		exit 0
	fi
}
