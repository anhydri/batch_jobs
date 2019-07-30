#!/bin/bash

# Count the number of jobs in queue
usrjobs=$(squeue | grep angu0022 | wc -l)

# Run only if the number of jobs in queue is less than 21
if [[ $usrjobs -le 25 ]]
then
	nrjobtosub=$((25-$usrjobs))                # The number of jobs can be submitted
	head -$nrjobtosub jobs.txt > tmpfile       # Put these job names in tmpfile file
	whereweare=$(pwd)
		while read i                           # Read line by line of tmpfile
		do
			echo Job: $i >> $whereweare/runjobs.out
			pathi=$(python /home/angu0022/bin/forFiFi/getPath.py "$i")
			namei=$(python /home/angu0022/bin/forFiFi/getName.py "$i")
			cd $pathi
			sbatch $namei >> $whereweare/runjobs.out       # Submit job
			cd $whereweare
			sed '1d' jobs.txt > tmpjobfile     # Remove the first line in jobs.txt
			mv tmpjobfile jobs.txt
		done < tmpfile
	rm tmpfile                                 # Remove the tmpfile
fi
