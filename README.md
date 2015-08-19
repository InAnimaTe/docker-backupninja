```
#
#                          |\_
# docker-backupninja      /()/
#                         `\|
# Utilizing Backup Ninjas...
#
```

This container was meant to login to, and backup, other machines via ssh utilizing backupninja along with things like rsync, rdiff-backup, or duplicity.


This container is also equipped with ssmtp, so mailing is possible, just bind mount your ssmtp config directory
