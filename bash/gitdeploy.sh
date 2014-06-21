#!/bin/bash -e

#Error handling
function report_error {
  if [ $? = 0 ]; then
    #do nothing
    echo ""
  else
    echo ""
    echo "##########################################################################"
    echo "Error: An error occured in between the process."
    echo "ERROR MESSAGE:"
    cat /tmp/gitdeploy.log
  fi
  exit;
}

trap report_error INT TERM EXIT

#Utility script to perform git tag and merge and genertate email post deployment
echo -n "enter your prime-service workspace path: "
read path
echo -n "enter release branch name: "
read branch

DAY=`/bin/date +%Y%m%d`

echo "validating workspace path and if branch exists"
if [ ! -d $path ]; then
  echo " workspace path is invalid"
  exit 1
fi

echo "workspace path is valid"

echo "logging " > /tmp/gitdeploy.log
cd $path
echo "git pull - to udpate workspace"
# udpate workspace
#TODO check for uncommited changes and throw error
git pull &> /tmp/gitdeploy.log

count=$(git branch -a | grep $branch | wc -l)
if [ $count -eq 0 -o $count -lt 0 ]; then
  echo "invalid branch name"
  exit 1
fi

echo "branch '$branch' exists"
echo "updating master"
echo "git checkout master & git pull origin master "
git checkout master &> /tmp/gitdeploy.log
git pull origin master &> /tmp/gitdeploy.log

echo "updating branch"
echo "git checkout $branch & git pull origin $branch"
git checkout $branch  &> /tmp/gitdeploy.log
git pull origin $branch  &> /tmp/gitdeploy.log

echo "merge master to branch - done just as a safety check"
echo "git merge master "
git merge master  &> /tmp/gitdeploy.log

echo "build release tags "
release_tag=$DAY"_release_of_"$branch
prerelease_tag=$DAY"_prerelease_for_"$branch


echo "release tag on branch $release_tag"
git tag -a $release_tag -m "tag before release $branch" &> /tmp/gitdeploy.log 

git checkout master  &> /tmp/gitdeploy.log 
echo "prerelease tag on master $prerelease_tag"
git tag -a $prerelease_tag -m "tag before merge of $branch to master" &> /tmp/gitdeploy.log 

echo "merging branch to master"
git merge $branch &> /tmp/gitdeploy.log 

echo "pushing changes "
#git push $release_tag  &> /tmp/gitdeploy.log 
#git push $prerelease_tag  &> /tmp/gitdeploy.log 
#git push origin master  &> /tmp/gitdeploy.log 


echo "done"
echo ""
echo "EMAIL TEMPLATE"
echo "###############################################################"
echo ""
echo " Subject:"
echo "prime-services repo : $branch branch merged into master"
echo ""
echo " Body:"
echo "Pre merge tag on master : $prerelease_tag"
echo "Release tag on $branch : $release_tag"
echo "Please update your branch with latest changes from master."
echo ""
echo "###############################################################"

exit 0

