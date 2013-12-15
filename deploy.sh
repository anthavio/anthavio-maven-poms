#!/bin/bash

#REPO_OPTS="-Durl=http://oss.sonatype.org/content/repositories/snapshots -DrepositoryId=sonatype-oss-snapshots"
REPO_OPTS="-Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2 -DrepositoryId=sonatype-oss-staging"

doDeploy() {
	#mvn deploy:deploy-file -Dfile=$1 -DpomFile=$1 $REPO_OPTS
	mvn gpg:sign-and-deploy-file -Dfile=$1 -DpomFile=$1 $REPO_OPTS
}

if [ "$1" != "" ]; then
	doDeploy $1
else
	for file in *.pom
	do
		doDeploy $file
	done
fi
