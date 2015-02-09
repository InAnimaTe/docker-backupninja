# BACKUPNINJA's are after YOU@!

FROM dockerfile/supervisor

RUN apt-get update && \
    apt-get install backupninja debconf-utils duplicity genisoimage rdiff-backup subversion subversion-tools rsync trickle gzip bzip2 cron autofs -y && \
    apt-get purge apparmor -y && \
    rm -rf /var/lib/apt/lists/*

## Add in our config files
ADD backupninja.conf /etc/backupninja.conf

## Adding in our server configs
ADD backup.d /etc/backup.d

## Setting up our autofs mount(s)
RUN echo "/- /etc/auto.mounts" >> /etc/auto.master
ADD auto.mounts /etc/auto.mounts

## Setup Supervisor
ADD supervisor-cron.conf /etc/supervisor/conf.d/supervisor-cron.conf
ADD supervisor-autofs.conf /etc/supervisor/conf.d/supervisor-autofs.conf

## [Optional] Add in our private key to use to connect to nodes
#ADD id_rsa /root/.ssh/id_rsa
#RUN chmod 600 /root/.ssh/id_rsa

