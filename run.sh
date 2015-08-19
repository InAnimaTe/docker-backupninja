#!/bin/bash

set -e

STDOUT_LOC=${STDOUT_LOC:-/proc/1/fd/1}  
STDERR_LOC=${STDERR_LOC:-/proc/1/fd/2}

BACKUP_DECLARATIONS=${BACKUP_DECLARATIONS:-/etc/backup.d}
PRIV_KEY_LOC=${PRIV_KEY_LOC:-/root/.ssh/id_rsa}

echo "0 * * * * chmod 700 ${BACKUP_DECLARATIONS}; chown -R root:root ${BACKUP_DECLARATIONS}; chmod 600 ${BACKUP_DECLARATIONS}/*; chmod 600 ${PRIV_KEY_LOC}; /usr/sbin/backupninja > ${STDOUT_LOC} 2> ${STDERR_LOC}" | crontab -
exec cron -f
