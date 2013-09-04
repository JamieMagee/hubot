#!/bin/bash

# Set environment variables
. ./var.sh

# Output environment variables
echo HUBOT_IRC_NICK=$HUBOT_IRC_NICK
echo HUBOT_IRC_SERVER=$HUBOT_IRC_SERVER
echo HUBOT_IRC_ROOMS=$HUBOT_IRC_ROOMS

#echo HUBOT_IRC_PORT=$HUBOT_IRC_PORT
#echo HUBOT_IRC_USESSL=$HUBOT_IRC_USESSL
#echo HUBOT_IRC_SERVER_FAKE_SSL=$HUBOT_IRC_SERVER_FAKE_SSL
#echo HUBOT_IRC_PASSWORD=$HUBOT_IRC_PASSWORD

# Start the redis brain
echo ""
echo "Starting Redis Server"
/usr/local/bin/redis-server > /dev/null &

rm -f stop-looping

while true
do
    if [ -e 'stop-looping' ]
    then
        echo "Stopping! Because you told me to."
        break
    fi
    git pull origin master
	echo "Starting hubot"
	./bin/hubot -a irc
	echo -n "hubot stopped. Waiting 20s before restart. PID is "
    echo $$
    sleep 20
done
