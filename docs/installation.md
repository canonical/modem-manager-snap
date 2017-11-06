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
modem-manager 1.6.2-3 from 'canonical' installed
```

Although the modem-manager snap is available from other channels (candidate,
beta, edge), only the stable version should be used for production devices. The
meaning of the other channels is internal to the development team of the
modem-manager snap.

All necessary plugs and slots will be automatically connected within the
installation process. You can verify this with:

```text
$ snap interfaces modem-manager
Slot                   Plug
modem-manager:service  modem-manager:mmcli
```

We see here that the _mmcli_ command line utility can use the ModemManager
service.

**NOTE:** The _network-manager:modem-manager_ plug is connected to the
_modem-manager:service_ slot when the NetworkManager snap is installed too.

Once the installation has successfully finished the ModemManager service is
running in the background. You can check its current status with

```text
$ systemctl status snap.modem-manager.modemmanager.service 
● snap.modem-manager.modemmanager.service - Service for snap application modem-manager.modemmanager
   Loaded: loaded (/etc/systemd/system/snap.modem-manager.modemmanager.service; enabled; vendor preset: enabled)
   Active: active (running) since Wed 2017-03-22 10:41:02 UTC; 3min 27s ago
 Main PID: 2518 (modemmanager)
   CGroup: /system.slice/snap.modem-manager.modemmanager.service
           ├─2518 /bin/sh /snap/modem-manager/39/bin/modemmanager
           └─2525 /snap/modem-manager/39/usr/sbin/ModemManager
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

## Next Steps

 * [Gathering Modem Information](gathering-modem-information.md)
 * [Entering SIM Passwords](entering-sim-passwords.md)
 * [Configuring Cellular Connections](configuring-cellular-connections.md)
 * [Enable Debug Support](reference/snap-configuration/debug.md)
