#!/bin/bash
set -e

export JAVA_HOME=/opt/java/openjdk
export PATH=$JAVA_HOME/bin:$PATH

export JAVA_HOME=/opt/java/openjdk
export PATH=$JAVA_HOME/bin:$PATH
java -version

exec /usr/bin/tini -- /usr/local/bin/jenkins.sh "$@"
