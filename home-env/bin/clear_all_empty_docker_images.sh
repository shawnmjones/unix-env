#!/bin/bash

for i in `docker image list | grep "<none>" | awk '{ print $3 }'`; do
    docker rmi ${i}
done
