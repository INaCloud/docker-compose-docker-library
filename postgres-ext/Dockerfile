FROM postgres:9.6

# Install packages required for developing on postgres
RUN apt-get update --fix-missing -y
RUN apt-get install -y build-essential checkinstall apt-utils
RUN apt-get install -y wget git-core
RUN apt-get install -y postgresql-server-dev-$PG_MAJOR
RUN apt-get install -y postgresql-contrib-$PG_MAJOR
RUN apt-get install -y postgresql-plpython3-$PG_MAJOR


# backup scripts
ADD /dbutils/backup.sh /usr/local/bin/backup
ADD /dbutils/restore.sh /usr/local/bin/restore
ADD /dbutils/list-backups.sh /usr/local/bin/list-backups
ADD /dbutils/shell.sh /usr/local/bin/shell


# make them executable
RUN chmod +x /usr/local/bin/restore
RUN chmod +x /usr/local/bin/list-backups
RUN chmod +x /usr/local/bin/backup
RUN chmod +x /usr/local/bin/shell
