# fakeShark.sh

## Overview

The `fakeShark.sh` script is designed to monitor a specified log file for occurrences of a particular keyword. When launched with appropriate arguments, it continuously watches the specified log file (`<file>`) and filters its content for occurrences of a given keyword (`<keyword>`).

## Functionality

### Argument Validation

It first checks if the correct number of command-line arguments (`$#`) is provided. If not, it displays a usage message indicating how to correctly use the script and exits.

### Variable Definitions

- `basicShark`: This variable holds the command to monitor the log file (`tail -f $1`) in real-time, then pipes the output to both a log file (`tee ~/Documents/fakeShark.txt`) and a filter (`grep -i $2`) to search for occurrences of a specific keyword case-insensitively.
- `logfile`: This variable holds the path to the log file (`~/Documents/fakeShark.txt`).

### Remote Server Details

It provides placeholders for the remote server details (`remote_username` and `ip_address`) where the log file will be transferred if certain conditions are met.

### Main Loop

It enters a continuous loop (`while true; do`) to constantly monitor the log file. Within the loop:
- It executes the `basicShark` command, monitoring the log file and filtering its content for occurrences of the keyword.
- It counts the number of lines in the log file (`lines=$(wc -l < "$logfile")`).
- Based on the number of lines in the log file:
  - If the line count is less than 5, it does nothing.
  - If the line count is greater than 6, it transfers the log file to the remote server using `scp`.

### Exit

It exits the script with status code 0 once the loop is terminated.

### Comments

It provides comments explaining how to grant execute permissions to the script and how to run it with the appropriate arguments.

## Summary

In summary, this script is a monitoring tool for log files, allowing users to track specific keywords in real-time and transfer the log file to a remote server under certain conditions.
