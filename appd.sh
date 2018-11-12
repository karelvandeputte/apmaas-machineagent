#!/bin/sh

APPD_ROOT="/opt/appdynamics"
APPD_APP_AGENT_TMP="$APPD_ROOT/javaagent/"
APPD_MACHINE="$APPD_ROOT/machine-agent"

# Cleanup old .id files
find $APPD_ROOT -iname *.id -exec /bin/sh -c "rm -rf {}" \;

cp -r $APPD_APP_AGENT_TMP/* $APPD_ROOT/app-agent
rm -rf $APPD_APP_AGENT_TMP

$APPD_MACHINE/bin/machine-agent start

