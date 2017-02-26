#!/bin/bash
# ambi-tv daemon service
# description: ambi-tv daemon
# processname: ambi-tv
### BEGIN INIT INFO
# Provides:          ambi-tv
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: ambi-tv Ambilight init.d Service.
# Description:       ambi-tv Ambilight init.d Service.
### END INIT INFO

DAEMON="word-clock"
DAEMONOPTS=""
DAEMON_PATH="/usr/bin"

NAME=$DAEMON
DESC="ambi-tv server"
PIDFILE=/var/run/$NAME.pid
SCRIPTNAME=/etc/init.d/$NAME
case "$1" in
start)
        if [ $(pgrep -xl $NAME |wc -l) = 1 ]
        then
                printf  "%-50s\n" "Already running..."
                exit 1
        else
                printf "%-50s" "Starting $NAME..."
                PID=`sudo $DAEMON_PATH/$DAEMON $DAEMONOPTS > /dev/null 2>&1 & echo $!`
                #echo "Saving PID" $PID " to " $PIDFILE
                if [ -z $PID ]; then
                    printf "%s\n" "Fail"
                else
                    sudo echo $PID > $PIDFILE
                    printf "%s\n" "Ok"
                fi
        fi
;;
status)
        printf "%-50s" "Checking $NAME..."
        if [ -f $PIDFILE ]; then
            PID=`cat $PIDFILE`
            if [ -z "`ps axf | grep ${PID} | grep -v grep`" ]; then
                printf "%s\n" "Process dead but pidfile exists"
            else
                echo "Running"
            fi
        else
            printf "%s\n" "Service not running"
        fi
;;
stop)
        if [ -f $PIDFILE ]
        then
                printf "%-50s" "Stopping $NAME"
                    PID=`cat $PIDFILE`
                    cd $DAEMON_PATH
                if [ -f $PIDFILE ]; then
                    sudo kill $PID
                    printf "%s\n" "Ok"
                    sudo rm -f $PIDFILE
                else
                    printf "%s\n" "pidfile not found"
                fi
        else
                printf "%-50s\n" "No PID file $NAME not running?"
        fi
;;

restart)
        $0 stop
        $0 start
;;

*)
        echo "Usage: $0 {status|start|stop|restart}"
        exit 1
esac

exit 0
