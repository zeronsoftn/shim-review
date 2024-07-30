#!/bin/sh

docker buildx build --output=type=tar,dest=tmp.tar -f show-sbat.Dockerfile --build-arg DUMMY="$(date)" $@ . 2>&1 | tee log.txt > /dev/null
cat log.txt | perl -pe 's/[^[:ascii:]]//g' | cut -d' ' -f3- | grep --text -A10 "^SBAT:"

