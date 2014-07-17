#!/usr/bin/python

# Utility script to copy files to a backup folder when we need to checkout and move  to a branch and copy back the earlier changed files back
#git status | grep modified  | awk '{ print $3 }' > files
# cat files | xargs -t -I '{}' cp '{}' ../bk/
# git checkout .
# git checkout to the right branch
# python gitutil.py < files #(Copy back)

import sys
import shutil

for line in sys.stdin:
#  print line
   line = line.rstrip("\n")
   shutil.copyfile("../bk/"+line.split("/")[-1],line)
