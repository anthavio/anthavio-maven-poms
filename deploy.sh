#!/bin/bash

REPO_OPTS="-Durl=http://oss.sonatype.org/content/repositories/snapshots -DrepositoryId=sonatype-oss-snapshots"
doDeploy() {
	#mvn install -f $1
	mvn deploy:deploy-file -Dfile=$1 -DpomFile=$1 $REPO_OPTS
}

if [ "$1" != "" ]; then
	doDeploy $1
else
	for file in *.pom
	do
		doDeploy $file
	done
fi
