---
title: "Report a Bug"
table_of_contents: False
---

# Report a Bug

Bugs can be reported [here](https://bugs.launchpad.net/snappy-hwe-snaps/+filebug).

If the bug can be reproduced, [enabling the debug
output](reference/snap-configuration/debug.md) before doing so is
highly recommended.

When submitting the bug report, please attach system log coming from the journal:

 * $ journalctl --no-pager > system-log

And the output of the following command:

```text
$ sudo modem-manager.mmcli -m <N>
```

, being <N> the modem number as reported by

```text
$ sudo modem-manager.mmcli -L
```
