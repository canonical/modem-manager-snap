---
title: "Report a Bug"
table_of_contents: False
---

# Report a Bug

Bugs can be reported [here](https://bugs.launchpad.net/snappy-hwe-snaps/+filebug).

When submitting a bug report, please attach:

 * */var/log/syslog*

And the output of the following command:

```text
$ sudo modem-manager.mmcli -m <N>
```

, being <N> the modem number as reported by

```text
$ sudo modem-manager.mmcli -L
```
