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

prepare_java_installer()
{
	# get install-java.sh script
	wget https://raw.githubusercontent.com/chrishantha/install-java/master/install-java.sh
	
	chmod u+x install-java.sh
}

prepare_jdk()
{
	# get JDK 8 from dropbox to avoid signing in to oracle
	wget https://dl.dropboxusercontent.com/s/6jrpd1uxrlhhsni/jdk-8u211-linux-x64.tar.gz
}

install_java()
{
	prepare_java_installer
	prepare_jdk

	mkdir -p /usr/lib/jvm

	# run installer
	yes | sudo -E ./install-java.sh -f jdk-8u211-linux-x64.tar.gz -p /usr/lib/jvm
}

prepare_dependencies()
{
	# required by the install-java.sh script
	apt-get install unzip

	install_java
}

main()
{	
	prepare_workdir ~/solidwaffle
}

main
