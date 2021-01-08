ls -l |awk '{print $5," ",$9}' | sort -n -r | more

#To display the largest folders/files including the sub-directories, run:

du -Sh | sort -rh | head -5

#If you want to display the biggest file sizes only, then run the following command:

find -type f -exec du -Sh {} + | sort -rh | head -n 5

#To find the largest files in a particular location, just include the path besides the find command:

find /home/ubuntuclient/Downloads/ -type f -exec du -Sh {} + | sort -rh | head -n 5

#to find out largest folders only with human readable,chnage the counts accordingly

 du -hsx -- * | sort -rh | head -20
