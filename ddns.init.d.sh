#!/bin/sh

### BEGIN INIT INFO
# Provides:          ddns
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: DNSPod service.
# Description:       DNSPod service.
# chkconfig: - 85 14
### END INIT INFO

# Author: Hu Hongcheng <879799939@qq.com>


PROG="ddns"
PROG_PATH="/opt/ddns"
PID_PATH="/var/run/"

start() {
    if [ -e "$PID_PATH/$PROG.pid" ]; then
        echo "Error! $PROG is currently running!" 1>&2
        exit 1
    else
        $PROG_PATH/$PROG 2>&1 >> /var/log/$PROG &
#        $pid=`ps -A | grep 'ddns' | awk '{print $1}' | head -n 1`
#
        echo "$PROG started!"
#        echo $pid > "$PID_PATH/$PROG.pid"
    fi
}

status() {
    if [ -e "$PID_PATH/$PROG.pid" ]; then
        echo "$PROG is currently running!" $(cat "$PID_PATH/$PROG.pid") 1>&2
    else
        ech "$PROG is not running!"
    fi
}

stop() {
    echo "begin stop"
    if [ -e "$PID_PATH/$PROG.pid" ]; then
        kill $(cat "$PID_PATH/$PROG.pid")
        rm "$PID_PATH/$PROG.pid"
        echo "$PROG stopped"
        exit 0
    else
        ## Program is not running, exit with error.
        echo "Error! $PROG not started!" 1>&2
        exit 1
    fi
}

if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

case "$1" in
    start)
        start
        exit 0
    ;;
    stop)
        stop
        exit 0
    ;;
    reload|restart|force-reload)
        stop
        start
        exit 0
    ;;
    status)
        status
        exit 0
    ;;
    **)
        echo "Usage: $0 {start|stop|reload|status}" 1>&2
        exit 1
    ;;
esac

:
