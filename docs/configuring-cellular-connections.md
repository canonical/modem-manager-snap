---
title: "Configuring Cellular Connections"
table_of_contents: False
---

# Configuring Cellular Connections

To establish a cellular connection:

```text
$ sudo mmcli -m 0 --simple-connect="apn=my.carrier.apn"
successfully connected the modem
```

**NOTE:** This makes the modem establish a cellular connection but does not
create a network interface, so the connection is not directly usable. To be able
to use data, pppd or {mbim,qmi}-proxy need to be run with the right parameters.
It is highly recommended to use NetworkManager instead, as explained in the
['About' section](index.html).

To find out the bearer path:

```text
$ sudo mmcli -m 0 --list-bearers
Found 1 bearers:
	/org/freedesktop/ModemManager1/Bearer/0
```

To retrieve information about the bearer (as usual, we specify the bearer with
the number at the end of the bearer's DBus path):

```text
$ sudo mmcli -b 0
Bearer '/org/freedesktop/ModemManager1/Bearer/0'
  -------------------------
  Status             |   connected: 'yes'
                     |   suspended: 'no'
                     |   interface: 'ttyUSB3'
                     |  IP timeout: '20'
  -------------------------
  Properties         |         apn: 'my.carrier.apn'
                     |     roaming: 'allowed'
                     |     IP type: 'none'
                     |        user: 'none'
                     |    password: 'none'
                     |      number: 'none'
                     | Rm protocol: 'unknown'
  -------------------------
  IPv4 configuration |   method: 'ppp'
                     |  address: 'unknown'
                     |   prefix: '0'
                     |  gateway: 'unknown'
                     |      DNS: none
  -------------------------
  IPv6 configuration |   method: 'unknown'
  -------------------------
  Stats              |          Duration: '419'
                     |    Bytes received: 'N/A'
                     | Bytes transmitted: 'N/A'
```
