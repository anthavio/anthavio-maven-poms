#!/bin/bash

# Deploys pom/bom into Sonatype OSS - https://oss.sonatype.org/index.html#stagingRepositories
# Follow - https://docs.sonatype.org/display/Repository/Sonatype+OSS+Maven+Repository+Usage+Guide#SonatypeOSSMavenRepositoryUsageGuide-8a.ReleaseIt

#REPO_OPTS="-Durl=http://oss.sonatype.org/content/repositories/snapshots -DrepositoryId=sonatype-oss-snapshots"
REPO_OPTS="-Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2 -DrepositoryId=sonatype-oss-staging"

doDeploy() {
	#mvn deploy:deploy-file -Dfile=$1 -DpomFile=$1 $REPO_OPTS
	mvn gpg:sign-and-deploy-file -Dfile=$1 -DpomFile=$1 $REPO_OPTS
    # gpg deploy do not install into local repo...
    mvn install -f $1
}

if [ "$1" != "" ]; then
	doDeploy $1
else
	for file in *.pom
	do
		doDeploy $file
	done
fi
