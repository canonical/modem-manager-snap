---
title: Debug
table_of_contents: True
---

# Debug

The debug configuration option controls the amount of logs produced by the
modem-manager snap. It is useful for collecting information required to either
report a bug or investigate a modem-manager failure.

It is disabled by default and has to be explicitely turned on for usage.

Note that the debug logs may contain sensitive information.

## Enable Debug

The modem-manager snap provides a single configuration option which can be used to
turn the debug feature either on or off:

 * **debug.enable**

The option takes a boolean value. The meaning of the possible values are:

 * **true:** Enable logging debug information
 * **false (default):** Disable logging debug information

Changing the **debug** configuration option has immediate effect and also
affects future executions of the MM daemon.

**Example:** Enable debug feature

```
$ snap set modem-manager debug.enable=true
```

<br/>
**Example:** Disable debug feature.

```
$ snap set modem-manager debug.enable=false
```

## Viewing logs

The debug information, when enabled, will be available in the journal and can
be viewed with:

```
$ journalctl --no-pager -u snap.modem-manager.modemmanager.service
```
