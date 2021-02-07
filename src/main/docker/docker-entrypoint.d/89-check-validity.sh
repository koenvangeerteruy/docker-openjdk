#!/bin/bash

1>&2 echo "Verifying image age..."
currentDate=`date +%s`
if [ -z "${BUILD_DATE}" ]
then
    1>&2 echo "$(tput setaf 3)****************************************************$(tput sgr0)"
    1>&2 echo "$(tput setaf 3)Unable to determine image age: BUILD_DATE is not set$(tput sgr0)"
    1>&2 echo "$(tput setaf 3)****************************************************$(tput sgr0)"
else
    timeElapsed=$(( currentDate - BUILD_DATE ))
    if (( timeElapsed >= 2592000 )) # 30 days
    then
        1>&2 echo "$(tput setaf 3)****************************************************************************************$(tput sgr0)"
        1>&2 echo "$(tput setaf 3)This is an old image: BUILD_DATE=$(date -d @$BUILD_DATE +"%Y-%m-%d %H:%M:%S") and currentDate=$(date -d @$currentDate +"%Y-%m-%d %H:%M:%S")$(tput sgr0)"
        1>&2 echo "$(tput setaf 3)****************************************************************************************$(tput sgr0)"
    fi
fi
1>&2 echo "Verifying image age... DONE!"
