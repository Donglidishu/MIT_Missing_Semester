#!/bin/bash

echo "Starting program at $(date)"

echo "Running program $0 with $# arguments with pid $$"

for file in "$@"; do
	grep foobar "$file" > ./temp/output.txt 2> ./temp/output.txt
	#When pattern is not found, grep has exit status 1
	# We redirect STDOUT and STDERR to a temp file
	
	if [[ "$?" -ne 0 ]]; then
		echo "File $file does not have any foobar, adding one"
		echo "# foobar" >> "$file"
	fi
done
