#!/bin/sh

echo "Wait for firstboot change to be ready"
while ! snap changes | grep -q "Done"; do
	snap changes || true
	snap change 1 || true
	sleep 1
done

echo "Ensure fundamental snaps are still present"
. $TESTSLIB/snap-names.sh
for name in $gadget_name $kernel_name $core_name; do
	if ! snap list | grep -q $name ; then
		echo "Not all fundamental snaps are available, all-snap image not valid"
		echo "Currently installed snaps:"
		snap list
		exit 1
	fi
done

echo "Kernel has a store revision"
snap list | grep ^${kernel_name} | grep -E " [0-9]+\s+canonical"

# If we don't install modem-manager here we get a system
# without any network connectivity after reboot.
if [ -n "$SNAP_CHANNEL" ] ; then
	# Don't reinstall if we have it installed already
	if ! snap list | grep modem-manager ; then
		snap install --$SNAP_CHANNEL modem-manager
	fi
else
        # Install first from store to avoid error when performing the connection
        snap install modem-manager
	# Install prebuilt modem-manager snap
	snap install --dangerous /home/modem-manager/modem-manager_*_amd64.snap
	# As we have a snap which we build locally its unasserted and therefore
	# we don't have any snap-declarations in place and need to manually
	# connect all plugs.
	# NOTE This step is not needed (and will produce an error) because we
	# have made an initial installation for the store. When snapd finally
	# allows somehow connections of locally installed snaps this can be put
	# in place again, and the installation from the store removed.
	##sudo snap connect modem-manager:mmcli modem-manager:service
fi

# Snapshot of the current snapd state for a later restore
if [ ! -f $SPREAD_PATH/snapd-state.tar.gz ] ; then
	systemctl stop snapd.service snapd.socket
	tar czf $SPREAD_PATH/snapd-state.tar.gz /var/lib/snapd /etc/netplan
	systemctl start snapd.socket
fi

# For debugging dump all snaps and connected slots/plugs
snap list
snap interfaces
