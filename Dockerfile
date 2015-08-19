# BACKUPNINJA's are after YOU@!

FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install openssh-client debconf-utils duplicity genisoimage rdiff-backup rsync trickle gzip bzip2 cron dialog -y && \
    ## Here are defined extras depending on the sort of backups youll be having the ninjas run ;)
    apt-get install mysql-client postgresql-client subversion subversion-tools -y && \
    apt-get build-dep backupninja -y && \
    rm -rf /var/lib/apt/lists/*

## Installing backupninja from our custom built debian package
ADD backupninja_1.0.1-2_4019-rsync-bug-fixed_all.deb /tmp/backupninja.deb
RUN dpkg -i /tmp/backupninja.deb

# Now we can install ssmtp, shouldn't be any incompatibilities with backupninja
RUN apt-get update && apt-get install ssmtp -y

## Add in our config files
ADD backupninja.conf /etc/backupninja.conf

## We are going to remove the default backupninja cron. Check the `run` init CMD script to see how we do it instead.
RUN rm -f /etc/cron.d/backupninja

## Adding in our server configs
ADD backup.d /etc/backup.d

## Add in our checkperms cron script to ensure permissions are up to par for backupninja
ADD checkperms /etc/cron.d/checkperms
RUN chmod 644 /etc/cron.d/checkperms

ADD run.sh /run.sh

CMD ["/run.sh"]

## [Optional] Add in our private key to use to connect to nodes
#ADD id_rsa /root/.ssh/id_rsa
#RUN chmod 600 /root/.ssh/id_rsa

