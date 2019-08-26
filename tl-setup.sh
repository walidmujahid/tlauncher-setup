#!/bin/bash

# make sure the script is running as root
if [ "$UID" -ne "0" ]; then
	echo "You must root to run $0. Try following"
	echo "sudo $0"
	exit 9
fi

prepare_workdir()
{
	declare dirname=$1

	mkdir -p ${dirname}
	cd ${dirname}
}

delete_workdir()
{
	declare dirname=$1
	rm -rf dirname=$1
}

