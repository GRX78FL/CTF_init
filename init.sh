#!/bin/bash


#########################
                        #
project_root=~/HTB      #    Edit this variable if your notes are somewhere else
                        #
#########################


#this section performs basic checks 

if [ "$#" -ne 1 ]; then
	
	echo -e "\nError: missing parameters.\n"
	echo -e "Usage: $0 <box name>"
	exit 1
fi


if [ ! -d $project_root ]; then
	
	read -p "Request: \"$project_root\" folder not found, create now? (y/n) " -n 1 -r create
	echo

	if [ $create == "y" ] || [ $create == "Y" ]; then

		mkdir $project_root
	
	elif [ $create == "n" ] || [ $create == "N" ]; then

		echo "Quitting."
		exit 0

	else
		echo -e "ERROR: invalid selection \"$create\"... \n QUITTING."
		exit 1
	fi
fi


#this section creates the root directory of the current box


box_home=$project_root/$1/

#########################################################################
                                                                        #
directory_list=("nmap" "report" "machine_files" "www" "exploits")       #  Edit this list to fit your needs
                                                                        #
#########################################################################

if [ ! -d $box_home ]; then

	echo " - creating directory \"$1\" in \"$project_root\""
	mkdir $box_home
else
	echo -e "ERROR: directory \"$1\" already exists in \"$project_root\"! \n QUITTING."
	exit 1
fi

for i in ${directory_list[@]}; do
       
	echo " - creating $box_home$i"
	mkdir $box_home$i
done
