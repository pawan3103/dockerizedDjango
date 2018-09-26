#!/bin/bash
# stop on errors
set -e


if [ "$POSTGRES_USER" == "postgres" ]
then
    echo "creating backup"
    exit 1
fi

# export the postgres password so that subsequent commands don't ask for it
export PGPASSWORD=$POSTGRES_PASSWORD

echo "creating backup"
echo "==============="

FILENAME=backup_$(date +'%Y_%m_%dT%H_%M_%S').dump
pg_dump -Fc --no-acl --no-owner -h postgres -U $POSTGRES_USER > /backups/$FILENAME

echo "backup taken successfully - $FILENAME"
