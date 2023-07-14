# TRUQuote build db
# Don't use the latest tag, go to https://hub.docker.com/_/postgres and specify the version.
FROM postgres:15.3
# The command below is a Linux command to set the local.
RUN localedef -i en_GB -c -f UTF-8 -A /usr/share/locale/locale.alias en_GB.UTF-8
ENV LANG en_GB.utf8
#/var/lib/postgresql/data is designated as a volume in the postgres dockerfile
# For the build db place PGDATA will be the default mounted to a volume
# /mnt/host will be mounted to the working directory.
RUN mkdir -p /mnt/host/pg-log \
    && chown -R postgres:postgres /mnt/host/pg-log \
    && chmod 777 /mnt/host/pg-log \
    && mkdir -p /mnt/host/pg-foreign-data \
    && chown -R postgres:postgres /mnt/host/pg-foreign-data \
    && chmod 777 /mnt/host/pg-foreign-data
