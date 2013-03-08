#!/bin/bash

doInstall() {
	mvn install -f $1
	#mvn deploy:deploy-file -Dfile=$1 -DpomFile=$1 $REPO_OPTS
}

if [ "$1" != "" ]; then
	doInstall $1
else
	for file in *.pom
	do
		doInstall $file
	done
fi
