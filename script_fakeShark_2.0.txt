#!/bin/bash

# Displaying the script's name and authors
﻿echo "   __      _         _____ _                _    "
echo "  / _|    | |       / ____| |              | |   "
echo " | |_ __ _| | _ ___| (___ | |__   __ _ _ __| | __"
echo " |  _/ _` | |/ / _ \\___ \| '_ \ / _` | '__| |/ /"
echo " | || (_| |   <  __/____) | | | | (_| | |  |   < "
echo " |_| \__,_|_|\_\___|_____/|_| |_|\__,_|_|  |_|\_\"
echo " Written  by Nikol.AI & Carbon"

# Check for valid command-line arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <file> <keyword>"
    exit 1
fi

# Define variables
basicShark="tail -f $1 | tee ~/Documents/fakeShark.txt | grep -i $2"  # Command to monitor log file and filter based on keyword
logfile=~/Documents/fakeShark.txt  # Path to the log file

# Remote server details (Replace placeholders with actual values)
remote_username="your_remote_username"  # Replace with your remote username
ip_address="your_ip_address"            # Replace with your remote server IP address

# Continuously monitor the log file
while true; do
    # Execute the basicShark command to monitor and filter log file
    $basicShark
    
    # Check the number of lines in the log file
    lines=$(wc -l < "$logfile")
    
    # Determine actions based on the number of lines
    if [ "$lines" -lt 5 ]; then
        :
    elif [ "$lines" -gt 6 ]; then
        # Transfer log file if conditions are met
        scp -q -r "$logfile" "$remote_username@$ip_address:/foo/bar"
    fi
done

exit 0

# To grant execute permissions to this script, run the following command:
# chmod +x fakeShark.sh
# To run the script, use the following command:
# ./fakeShark.sh <file> <keyword>
