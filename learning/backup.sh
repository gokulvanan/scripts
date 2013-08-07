#!/bin/bash -e

#commented 
#if [ -z $1 ]; then
#    echo " please enter backup_dir path"
#    exit 1
#fi

# note method below will cause copy to work on only one arg
# as a result when list of files are sent to inovke this script via xargs
# eg.. ls data/* | xargs ./backup.sh  only first argument gets worked on
#cp -rf $1 /tmp/

#changing to below command would support mulitp args
for f in $@
do 
    cp -rf $f /tmp
done
#Other modes of calling this script in paralle 
# find -name '*.csv' -print0 | xargs -0 -n10 -P4 sh backup.sh

