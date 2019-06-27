---
title: "Gathering Modem Information"
table_of_contents: False
---

# Gathering Modem Information

If we have a modem in the system, we should be able to see it with _mmcli -L_,
for instance:

```text
$ sudo mmcli -L
Found 1 modems:
	/org/freedesktop/ModemManager1/Modem/0 [BRAND] MODEL
```

The command shows the DBus path for the modem, with the number at the end of the
path being the argument to access it from the cli:

```text
$ sudo mmcli -m 0

/org/freedesktop/ModemManager1/Modem/0 (device id '817f7e2b3c6dfdf1d4ee7f4c4ecc34de61bc5de9')
  -------------------------
  Hardware |   manufacturer: 'BRAND'
           |          model: 'MODEL'
           |       revision: 'FW.REVISION'
           |      supported: 'gsm-umts'
           |        current: 'gsm-umts'
           |   equipment id: '988037034540195'
  -------------------------
  System   |         device: '/sys/devices/pci0000:00/0000:00:01.2/usb1/1-1'
           |        drivers: 'option1'
           |         plugin: 'generic'
           |   primary port: 'ttyUSB3'
           |          ports: 'ttyUSB0 (qcdm), ttyUSB1 (at), ttyUSB3 (at)'
  -------------------------
  Numbers  |           own : 'unknown'
  -------------------------
  Status   |           lock: 'none'
           | unlock retries: 'sim-pin (3), sim-puk (10)'
           |          state: 'disabled'
           |    power state: 'on'
           |    access tech: 'unknown'
           | signal quality: '0' (cached)
  -------------------------
  Modes    |      supported: 'allowed: 2g; preferred: none
           |                  allowed: 3g; preferred: none
           |                  allowed: 2g, 3g; preferred: none
           |                  allowed: 2g, 3g; preferred: 2g
           |                  allowed: 2g, 3g; preferred: 3g'
           |        current: 'allowed: any; preferred: none'
  -------------------------
  Bands    |      supported: 'unknown'
           |        current: 'unknown'
  -------------------------
  IP       |      supported: 'none'
  -------------------------
  3GPP     |           imei: '988037034540195'
           |  enabled locks: 'none'
           |    operator id: 'unknown'
           |  operator name: 'unknown'
           |   subscription: 'unknown'
           |   registration: 'unknown'
  -------------------------
  SIM      |           path: '/org/freedesktop/ModemManager1/SIM/0'

  -------------------------
  Bearers  |          paths: 'none'
```

This shows quite a bit of information: model, ports, status and so on. There is
an unlocked SIM card, but no bearer defined. Again, we use the last number in
the SIM path to access the SIM information:

```text
$ sudo mmcli -i 0
SIM '/org/freedesktop/ModemManager1/SIM/0'
  -------------------------
  Properties |          imsi : '123450030477777'
             |            id : '9876075782002298987'
             |   operator id : '21477'
             | operator name : 'my-oper'
```

As can be seen, status is initially 'disabled'.  To power on the modem we can
do:

```text
$ sudo mmcli -m 0 --enable --timeout=120
successfully enabled the modem
```

After this, the registration status should change:

```text
$ sudo mmcli -m 0
...
  -------------------------
  Status   |           lock: 'none'
           | unlock retries: 'sim-pin (3), sim-puk (10)'
           |          state: 'registered'
           |    power state: 'on'
           |    access tech: 'umts'
           | signal quality: '32' (recent)
  -------------------------
...
```
