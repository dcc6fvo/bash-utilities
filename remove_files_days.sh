#!/bin/bash

helpFunction()
{
   echo ""
   echo "Usage: $0 -d <dir> -n <days older>"
   echo -e "\t-d Full path of directory"
   echo -e "\t-n Older than 'n' days"
   exit 1 # Exit script after printing help
}

execFunction()
{
 echo "===Config==="
 echo "Dir=$paramD"
 echo "Days older=$paramN"
 echo "===Init==="
 sudo find $paramD* -ctime +$paramN -exec rm -rv {} \;
}

while getopts "d:n:" opt
do
   case "$opt" in
      d ) paramD="$OPTARG" ;;
      n ) paramN="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

if [ -z "$paramD" ]; then
   echo "Directory parameter is empty";
   helpFunction
 elif [ -z "$paramN" ]; then
   echo "Missing the number of days that file/dir is older. Assumming 365 days.";
   paramN=365;
   execFunction
else
   execFunction
fi


