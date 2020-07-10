---
title: "Install ModemManager"
table_of_contents: True
---

# Install ModemManager

The ModemManager snap is currently available from the Ubuntu Store. It can
be installed on any system that supports snaps but is only recommended on
[Ubuntu Core](https://www.ubuntu.com/core) at the moment.

You can install the snap with the following command:

```text
$ snap install modem-manager
modem-manager (1.10/stable) 1.10.0-4 from Canonical✓ installed
```

All necessary plugs and slots will be automatically connected within the
installation process. You can verify this with:

```text
$ snap connections modem-manager
Interface      Plug                           Slot                   Notes
modem-manager  modem-manager:mmcli            modem-manager:service  -
modem-manager  network-manager:modem-manager  modem-manager:service  -
```

We see here that the _mmcli_ command line utility can use the ModemManager
service and that network-manager can do the same (we will see that if
the network-manager snap is already installed in the system).

Once the installation has successfully finished the ModemManager service is
running in the background. You can check its current status with

```text
$ systemctl status snap.modem-manager.modemmanager.service 
● snap.modem-manager.modemmanager.service - Service for snap application modem-manager.modemmanager
   Loaded: loaded (/etc/systemd/system/snap.modem-manager.modemmanager.service; enabled; vendor preset: enabled)
   Active: active (running) since Fri 2020-07-10 08:34:43 UTC; 2min 20s ago
 Main PID: 2047 (ModemManager)
    Tasks: 3 (limit: 569)
   CGroup: /system.slice/snap.modem-manager.modemmanager.service
           └─2047 /snap/modem-manager/414/usr/sbin/ModemManager --filter-policy=STRICT --log-level=INFO
```

Now you have ModemManager successfully installed. In the next sections we will
briefly explain how to use part of ModemManager's features, using _mmcli_
command line interface to interact with the service. For a complete reference on
what can be done with ModemManager, take a look at [_mmcli_ man
page](https://www.freedesktop.org/software/ModemManager/man/latest/mmcli.8.html)
and to [ModemManager's DBus
interface](https://www.freedesktop.org/software/ModemManager/api/latest/).  It
is also possible to use _dbus-send_ to directly access the DBus interface if
desired.

Finally, note that to run both _mmcli_ and _dbus-send_ we need root permissions, so
we use _sudo_ with them.

# modem-manager tracks and channels

The modem-manager snap has currently three tracks:

* __20__: Contains upstream version 1.12.8 and has a core20 base. The track name
refers to the base snap and it is the convention being used at the moment.
* __1.10__: Contains upstream version 1.10.0 and has a core18
base. Nowadays, this is the one installed by default if the channel is
not specified when running `snap install`. The track name refers to the
upstream version. More modern releases have changed the convention so
the track now refers to the base snap.
* __latest__: Contains upstream version 1.8.0 and has a core16 base. Despite
the unfortunate name (there are historical reasons for that) it is the oldest version.

## Next Steps

 * [Gathering Modem Information](gathering-modem-information.md)
 * [Entering SIM Passwords](entering-sim-passwords.md)
 * [Configuring Cellular Connections](configuring-cellular-connections.md)
 * [Enable Debug Support](reference/snap-configuration/debug.md)
