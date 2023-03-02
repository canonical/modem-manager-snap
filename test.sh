#!/bin/sh -ex

x=""
if [ -f kk ]; then
    x=kk
fi

echo $x "$@"
