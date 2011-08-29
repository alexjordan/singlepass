#! /bin/sh

# RUNJS defined in user configuration
source user.mk

if [ -e $RUNJS ]; then
	export UTIL_PATH=$(dirname $(which $0))
	$RUNJS $UTIL_PATH/retcatch.js $@
else
	echo \'$RUNJS\' not found.
	echo Did you define RUNJS in user.mk?
	exit 1
fi
