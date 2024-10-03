# Final Command (inside dataset1 directory)
grep -c "sample" file* | grep -E ":1$" | cut -d: -f1 | xargs grep -c "CSC510" | grep -v -E ":0$|:1$|:2$" | sed 's/:/ /' | xargs -I{} sh -c 'set -- {}; wc -l $1 | gawk "{print \"$1:\" $2 \":\" \$1}"' | sort -t: -k2,2nr -k3,3nr | cut -d: -f1 | sed 's/file_/filtered_/'

# Final Command (in hw4 directory)
grep -c "sample" provided/dataset1/file* | grep -E ":1$" | cut -d: -f1 | xargs grep -c "CSC510" | grep -v -E ":0$|:1$|:2$" | sed 's/:/ /' | xargs -I{} sh -c 'set -- {}; wc -l $1 | gawk "{print \"$1:\" $2 \":\" \$1}"' | sort -t: -k2,2nr -k3,3nr | cut -d: -f1 | sed 's/file_/filtered_/' | cut -d/ -f3


##########
# Part A #
##########
grep -c "sample" file* |  #output: file_#:count of sample --> 0 or 1
grep -E ":1$" | #lists all files where sample count is 1
cut -d: -f1 | #removes :count from file name
xargs grep -c "CSC510" | #using those file names, count occurences of "CSC510" --> file_#:count of CSC510
grep -v -E ":0$|:1$|:2$" | #keeps files only with counts 3+

# Output after Part A (file_name:CSC510_count)
# file_10:6
# file_12:3
# file_13:3
# file_14:5
# file_2:4
# file_20:6
# file_22:4
# file_23:3
# file_24:5
# file_3:3
# file_30:3
# file_4:5


##########
# Part B #
##########
sed 's/:/ /' | #replaces : with space
#Output
# file_10 6
# file_12 3
# file_13 3
# file_14 5
# file_2 4
# file_20 6
# file_22 4
# file_23 3
# file_24 5
# file_3 3
# file_30 3
# file_4 5

xargs -I{} sh -c 'set -- {}; wc -l $1 | awk "{print \"$1:\" $2 \":\" \$1}"' | 
# xargs --> takes output from previous command to further build on
# -I{} --> defines placeholder so that each placeholder represents a line of the input (e.g. 'file_10 6')
#sh -c --> runs a shell command (sh) with the string given after -c. It allows running multiple shell commands together as a part of the script inside the string
# set -- {}; --> ssigns the arguments passed to it as positional parameters (e.g. $1 = file_10; $2 = 6)
# wc -l $1 --> counts the number of lines in each file (file name is passed in with $1)
# gawk "{print \"$1:\" $2 \":\" \$1}" --> takes the number of lines and reformates all of the information so that format follows file_name:csc510:numLines (\"$1:\": The escaped double quotes (\") indicate that $1 refers to the shell variable set before the command)

sort -t: -k2,2nr -k3,3nr | #using delimiter with ":" sort in descending order first by csc510, then by size
cut -d: -f1 | #removes csc510 and line
#Output
# file_20
# file_10
# file_4
# file_14
# file_24
# file_22
# file_2
# file_30
# file_3
# file_23
# file_12
# file_13

##########
# Part C #
##########
sed 's/file_/filtered_/' #replaces "file_" with "filtered_"
#Output
# filtered_20
# filtered_10
# filtered_4
# filtered_14
# filtered_24
# filtered_22
# filtered_2
# filtered_30
# filtered_3
# filtered_23
# filtered_12
# filtered_13

