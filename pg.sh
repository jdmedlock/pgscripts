#!/usr/bin/env bash
# usage
# sudo -u postgres bin/pg_ctl $1 -D $DATADIR

PG_DIR=/Library/PostgreSQL/12/bin
DATADIR=/Library/PostgreSQL/12/data
STATUS=$(sudo -u postgres $PG_DIR/pg_ctl status -D $DATADIR)

if [ $# -lt 1 ]; then
   echo "Usage : $0 [start|stop|status]"
   echo $STATUS
   exit
fi

if [ "$1" == "start" ]; then
  if [ "$STATUS" == "pg_ctl: no server running" ]; then
            sudo -u postgres $PG_DIR/pg_ctl $1 -D $DATADIR
        else
            echo "Server is already running."
            echo $STATUS
            echo "$0 stop - to stop the PostgresSQL server"
        fi
else
        sudo -u postgres $PG_DIR/pg_ctl $1 -D $DATADIR
fi