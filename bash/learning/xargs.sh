#!/bin/bash

find /etc -name '*.sh' | xargs head -2

#command to move modified files to a backup dir
git status | grep modified | awk '{ print $3 }'| xargs -t -I '{}' cp '{}' ../temp_bk/
# note -t prints each command and -I is a delim to identify first arg of cp as output from awk with line delim
