#!/bin/bash

while :
do
	output="$(pgrep -l $1)"
	if [[ -n "$output" ]] #-z to check for zero
	then
		echo "The process $1 is running."
	else
		echo "The process $1 is not running."
	fi
	sleep 3
done
