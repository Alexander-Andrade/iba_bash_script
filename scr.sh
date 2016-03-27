#!/bin/bash
#count matching symb in str
args=$@
#count matching substr
#echo $(expr match "$args" '[abcd ]*')
#echo $(expr "$args" : "[a-d234 ]*")

#cut from the string
#echo ${args:3:7}

#get first matching substr
echo $(expr match "$args" '\([a]\)')
str=$(expr match "$args" '\([a]\)') 

#str lenght
#echo ${#str}
 
#get last matching substr
#echo $(expr match "$args" '.*\(.\)')

a_found=$(expr match "$args" '\([a]\)')
if[${#a_found} -eq 0] then
fi
