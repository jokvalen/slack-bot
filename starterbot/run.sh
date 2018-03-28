#!/bin/bash
python ./starterbot.py & last_pid=$!
sleep 5s

for(( ; ; ))
do
git pull

if [ $? -eq 1 ]
then
echo new update found
kill -KILL $last_pid
echo restarting starterbot
./starterbot.py & last_pid=$!
fi

sleep 1m

if [ $last_pid -eq 0 ]
then
./starterbot.py & last_pid=$!
fi

done