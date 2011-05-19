#!/usr/local/bin/dash

# Dash, Bash, and minimal perl
# ============================
#
#     by: ben@untar.org
#
# ***

# Use dash when doing simple wrapper scripts

# Use bash when regular expressions are use

# use minimal perl when iterating through files


#donts | Stuff I dont like to do in shell scripting

# looping through lines 
# Messing with IFS (fragile)
# Using arrays (portability))

#vs | Hash vs Bash
#-----------------

# bash: heavier, more interactive

# dash: faster, non-interactive

# dash scripts work in bash but not vice versa

#( ls ; pwd ) | while read a b ; do echo $a; done

#grp | Grouping
#--------------
#
# Grouping commands for 
#    { CMDS; }
#
#    { 
#      CMDS
#     }

# convenience:

{ 
    echo "Hello"
    echo "-----"
    echo " bye"
} > myfile.txt

# or to pipe stuff:

{ echo "Hello" && echo "-----" && echo " bye"; } | while read a ; do echo "x $a"; done

#sub | Subshell
#---------------
#
# Comes handy when running the script with
#     set -e
# For example a non-matching 'grep' could tear the whole script down.

# Something line a try-finally
set -e
( grep -li xxxx .  ) || { echo "OK something went wrong"; }

echo "the script is still here"

# This would break the script
#     grep -li xxxx .
#     echo "the script is gone"

#ar | Arithmetics
#----------------

echo $(( 3 + 4 ))

#for | for loops
#---------------

for i in 1 2 3 4; do echo $i; done

mypath='.'
[ $mypath ] || { echo "Error $mypath is empty, you work in root /. Dangerous!"; }

for i in "$mypath"/*; do 
    echo $i; 
done

#while | Piping with while loops
#------------------------------

ls . | while read i; do echo "val: $i "; done

#ifelse | If elif else
#---------------------

# On one line

if ( exit ) ; then echo "fail" ; else echo "never happen"; fi


if ls
then
    pwd
elif cd /boo
then
    echo "boo exists"
else
    echo "fail"
fi

#case | Case Statements
#-----------------------

x='c'

case $x in
    a) echo A;;
    b) echo B;;
    ?) echo other;; # for x='c'
    *) echo default;;  # for x=''
esac


#func | Functions
#----------------

# No 'function' keyword in dash

foo(){
    echo $1;
}
foo "xx"


z='booya'
[[ $z == 'booya' ]]; echo "match"



