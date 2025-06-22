#!/bin/bash

echo -n "Enter your favourite pet:"
read PET

case "$PET" in
	dog)
		echo "Your favourite pet is dog."
		;;
	cat|CAT)
		echo "You like cats."
		;;
	fish|"African Turture")
		echo "Fish or turtles are great!"
		;;
	*)
		echo "Your favourite pet is unknown."
esac
