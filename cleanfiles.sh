#Find empty directories in the current directory using find -empty

find . -type d -empty

#Use the following command to remove all empty directories under the current directory.

find . -type d -empty -exec rmdir {} \;

#Note: It is not recommended to remove empty directories from /etc/ or any other system directories.
