#!/bin/bash

val=$(hbase shell)
echo $val
if ! type hbase > /dev/null; then
	echo " No Hbase Installed, Please install hbase to use this script"
	exit 1
fi

echo "here"
output="$(echo 'list' | hbase shell)"
echo $output
