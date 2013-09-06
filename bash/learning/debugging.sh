#!/bin/bash 

#Simple Error handling routine example

PROGNAME=$(basename $0)

function error
{
  echo "${PROGNAME} : ${1:-'UnknownError'}" 1>&2
  exit 1
}

echo "Example of error with line number and message"
error "$LINENO : error occured"
