#!/bin/bash

export DISPLAY=":0.0"

OWNER=mike
USER=~mike

cd $USER/scripts/xbmc

if [ ! -f manager.log ]; then
  touch manager.log
  chown $OWNER:$OWNER manager.log
fi

touch manager.log

if [ $(pidof -x xbmc.bin) > /dev/null ]; then
  ps x | grep xbmc.bin | grep -v grep | awk '{print "kill -15 " $1}' | sh
  echo "[$(date)]: Killed XBMC" >> manager.log
  sleep 30
fi

nohup xbmc > /dev/null &
echo "[$(date)]: Started XBMC" >> manager.log

exit
