#!/bin/bash

# An infinite while-loop
while true
do
	date >> runjobs.out
	echo It is time. >> runjobs.out
	filename=jobs.txt                                     # Define a variable for jobs.txt file
	filesize=$(stat -c%s "$filename")                     # Define a variable for the size of jobs.txt file
	if [[ $filesize -ne 0 ]]                              # Condition: the file size of jobs.txt is not 0 byte
	then
		bash subjobs.sh                                      # Run subjobs.sh script
	else
		echo Mission is completed. >> runjobs.out                       # If size of jobs.sh is 0 byte
		exit 0                                            # Exit successfully
	fi 
	sleep 7200
done
