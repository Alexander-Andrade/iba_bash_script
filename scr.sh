#!/bin/bash
#count matching symb in str
args=$@
__ret_cmd=''
__cmd_result=''
__file_fl=0
show_help(){
	echo 'help'
}
#count matching substr
#echo $(expr match "$args" '[abcd ]*')
#echo $(expr "$args" : "[a-d234 ]*")

#cut from the string
#echo ${args:3:7}

#get first matching substr
#echo $(expr match "$args" '\([a]\)')
#str=$(expr match "$args" '\([a]\)') 

#str lenght
#echo ${#str}
 
#get last matching substr
#echo $(expr match "$args" '.*\(.\)')

command_template='\([[:blank:]]*[[:graph:]]\+\([[:blank:]]*=[[:blank:]]*[[:alnum:]]\+\)\?\)'
#general command check using command template (regular expr)
tested_cmd=$(expr match "$args" "$command_template")
#if there is no command args then show help
if [ $# -eq 0 ]
then
 	show_help
#if there is some commands, but they are incorrect
elif [ ${#tested_cmd} -eq 0 ]
then
	echo "by" 
	exit 1
fi

#substitute user commant to the template and apply it
find_user_cmd(){
	echo $args
	concr_cmd_templ="${command_template/\[\[:graph:\]\]\\+/$1}"
	echo $concr_cmd_templ
	__ret_cmd=$(expr match "$args" "$concr_cmd_templ")
}

#pure command or with file writing
exec_cmd(){
	if [ $__file_fl -eq 0 ]
	then 
		eval $1
	else
		touch $2
		#exec_res=eval $1	
		#echo $res | tee $2
	fi
}

find_user_cmd "to_file"
echo ${#__ret_cmd}
if [ ${#__ret_cmd} -ne 0 ]
then
	#find filename from the str end
	filename=$(expr match "$__ret_cmd" '.*\([[:alnum:]]\)')
	echo ${#filename}
	if [ ${#filename} -eq 0 ]
	then
		exit 1
	fi 
	#set file flag, it means that the output will be redirected alsaw
	__file_fl=1
fi

#show mounted file systems
find_user_cmd "mounted_FS"
echo ${#__ret_cmd}
if [ ${#__ret_cmd} -ne 0 ]
then
	#exec_cmd df $filename 
	echo " "	
#__cmd_result=$(df)
	#echo $__cmd_result	
fi







