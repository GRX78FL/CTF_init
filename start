#!/bin/bash


#########################
                        #
project_root=~/HTB      #    Edit this variable if your notes are somewhere else
                        #
#########################

WHITE='\033[0;37m'
RESET='\033[0m'
RED_B='\033[1;31m'
GREEN_B='\033[1;32m'
WHITE_B='\033[1;37m'
CYAN_B='\033[1;36m'

#this section performs basic checks 

if [ "$#" \< 1 ]; then
	
	echo -e "${WHITE}"
	echo -e "${RED_B}Error: ${NORMAL} ${WHITE} missing parameters."
	echo -e "${GREEN_B}Usage: ${NORMAL} ${WHITE} $0 <box name>\n${RESET}}"
	exit 1
fi


if [ ! -d $project_root ]; then
	
	echo -e "${GREEN_B}"
	read -p "Request: \"$project_root\" folder not found, create now? (y/n): "  -n 1 -r create
		echo -e ${WHITE}

	if [ $create == "y" ] || [ $create == "Y" ]; then

		mkdir $project_root
	
	elif [ $create == "n" ] || [ $create == "N" ]; then

		echo -e "${RED_B}Quitting.${RESET}\n"
		exit 0

	else
		echo -e "\n${RED_B}ERROR:${WHITE} invalid selection \"$create\"... \n${RED_B}QUITTING.${RESET}\n"
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

	echo -e "\n${GREEN_B} - creating directory \"$1\" in \"$project_root\""
	mkdir $box_home
else
	echo -e "${RED_B}ERROR: ${RESET}directory \"$1\" already exists in \"$project_root\"! \n${RED_B}QUITTING.${RESET}"
	exit 1
fi

echo 

for i in ${directory_list[@]}; do
       
	echo -e "${WHITE_B} - creating $box_home$i"
	mkdir $box_home$i
	sleep 0.1
done

echo -e "\n${CYAN_B}Done.${RESET}\n"
