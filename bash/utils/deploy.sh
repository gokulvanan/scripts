#!/bin/bash -e

#Error handling routine
PROGNAME=$(basename $0)
function error
{
  echo "${PROGNAME} : ${1:-'UnknownError'}" 1>&2
  exit 1
}

function installMongo()
{
  echo "Installing Mongo"
  if [$flag == 'Debian']; then
 	echo "Installing for debian"
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
	$? -eq 0 || error "$LINENO: Error in key configure on apt"; exit 1
	echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/10gen.list
	sudo apt-get update
	sudo apt-get install mongodb-10gen
	
  else
	installPath="/etc/yum.repos.d/10gen.repo" 
	echo "Installing for centos"	
	echo "[10gen]" > $installPath
	echo "name=10gen Repository" >> $installPath
	echo "baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64" >> $installPath
	echo "gpgcheck=0" >> $installPath
	echo "enabled=1" >> $installPath

	echo "File created"
	yum install mongo-10gen mongo-10gen-server || error "$LINENO : Error in yum install"; exit 1
  fi
  echo "Mongo has been installed"
}

if [ -z $1 ]; then
  echo "usage deployMWCron.sh packageName"
  exit 1
fi
packageName=$1
echo "Starting Deployment"

echo "Checking OS type"
count=$(find /etc -iname 'redhat*'  | wc -l)
if [ $? -eq 1 ]; then
  error "$LINENO: Error in checking OS Type"
  exit 1
fi
flag="Centos"
if [ $count -eq 0 ]; then
  flag="Debian"
fi
echo "OS type is $flag"

echo 'Check if mongo exist'
which mongo || installMongo

if which mongo; then 
  echo "installing $packageName"
  if [ $flag == 'Debian' ]; then 
    dpkg -i $packageName
  else
    rpm -i $packageName
  fi
  
  echo 'done with installation'
else
  error "$LINENO : Error in intallation"
  exit 1
fi
