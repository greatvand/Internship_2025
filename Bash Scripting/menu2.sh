#!/bin/bash
PS3="Choose your country:"
select COUNTRY in Germany France USA "United Kingdom" Quit
do
	case $REPLY in
	1)
		echo "You speak German."
		;;
	2)
		echo "You speak French."
		;;
	3)
		echo "You speak American English."
		;;
	4)
		echo "You speak British English."
		;;
	5)
		echo "Quitting..."
		sleep 1
		break
		;;
	*)
		echo "Invalid option $REPLY"
		;;
	esac
done
	
