Display or list all directories in Unix

Type the following command:

$ ls -l | grep '^d'
$ ls -l | egrep `'d'

only to list directories for the current directory:

$ ls -d */

Linux Display or list only files

ls -l | egrep -v '^d'
ls -l | grep -v '^d'

To find out the current system limit for file descriptors, 
cat /proc/sys/fs/file-max
To find out how many of the available file descriptors are being currently used,
cat /proc/sys/fs/file-nr
