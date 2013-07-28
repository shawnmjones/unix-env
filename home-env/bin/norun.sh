#!/bin/sh

if [ $HOST != "ws-dl-00" ]; then
    echo "You are not permitted to run $1 on $HOST"
else
    $@    
fi
