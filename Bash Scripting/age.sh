#!/bin/bash
read -p "Enter your age:" age

if [[ $age -lt 18 ]]
then
	echo "You are a minor!"
elif [[ $age -eq 18 ]]
then
	echo "You've just become a major!"
else
	echo "You are a major."
fi
