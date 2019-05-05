#!/bin/bash

check_exit_status() {

	if [ $? -eq 0 ]
	then
		echo
		echo "Process Successful"
		echo
	else
		echo
		echo "[ERROR] Process Failed!"
		echo
		
		read -p "The last command exited with an error. Exit script? (y/n) " answer

            if [ "$answer" == "y" ]
            then
                exit 1
            fi
	fi
}

greeting() {

	echo
	echo "Hello, $USER. Let's update this system."
	echo
}

update() {

        sudo apt-get update;
	check_exit_status

        sudo apt-get upgrade -y;
	check_exit_status

        sudo apt-get dist-upgrade -y;
	check_exit_status
}

cleanup() {

	sudo apt-get autoremove -y;
	check_exit_status

	sudo apt-get autoclean -y;
	check_exit_status

        sudo apt-get clean -y;
	check_exit_status

	sudo updatedb;
	check_exit_status
}

leave() {

	echo
	echo "----------------------------"
	echo "- System Update Complete! -"
	echo "----------------------------"
	echo
	exit
}

greeting
update
cleanup
leave
