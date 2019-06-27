---
title: "Entering SIM Passwords"
table_of_contents: False
---

# Entering SIM Passwords

We can find out if the SIM is locked by issuing:

```text
$ sudo mmcli -m 0
...
  -------------------------
  Status   |           lock: 'sim-pin'
           | unlock retries: 'sim-pin (3), sim-puk (10)'
           |          state: 'locked'
           |    power state: 'on'
           |    access tech: 'unknown'
           | signal quality: '0' (cached)
  -------------------------
...
  SIM      |           path: '/org/freedesktop/ModemManager1/SIM/0'
...
```

To enter the PIN for SIM 0:

```text
$ sudo mmcli -i 0 --pin=<pin_number>
successfully sent PIN code to the SIM
```

This changes the state as expected:

```text
$ sudo mmcli -m 0
...
  Status   |           lock: 'none'
           | unlock retries: 'sim-pin (3), sim-puk (10)'
           |          state: 'disabled'
...
```

In case we introduce the wrong PIN three times, we need to enter the PUK to
unlock the SIM card:

```text
$ sudo mmcli -i 0 --puk=<puk_code>
successfully sent PUK code to the SIM
```
