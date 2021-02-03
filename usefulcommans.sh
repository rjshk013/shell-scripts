Display or list all directories in Unix

Type the following command:

$ ls -l | grep '^d'
$ ls -l | egrep `'d'

only to list directories for the current directory:

$ ls -d */

Linux Display or list only files

ls -l | egrep -v '^d'
ls -l | grep -v '^d'
