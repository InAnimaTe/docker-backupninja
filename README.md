```
#
#                          |\_
# docker-backupninja      /()/
#                         `\|
# Utilizing Backup Ninjas...
#
```

This container was meant to login to, and backup, other machines via ssh utilizing backupninja along with things like rsync, rdiff-backup, or duplicity.

This container is equipped with autofs to automatically mount remote NFS storage for your backups.
However, we recommend you just use a `type = remote` for your backupninja jobs.

This container is also equipped with ssmtp, so mailing is possible, just bind mount your ssmtp config directory
