#!/bin/bash -l

SINKINPUT=$(pactl list short sinks | awk '$7 ~ /^RUNNING/ {print $2;exit}')

if [[ -z $SINKINPUT ]]
then
 : 
  else
    pactl set-default-sink "$SINKINPUT"
fi

