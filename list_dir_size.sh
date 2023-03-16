#!/bin/bash

helpFunction()
{
   echo ""
   echo "Usage: $0 -d <dir>"
   echo -e "\t-d Full path of directory"
   echo -e "\t-n Max depth"
   exit 1 # Exit script after printing help
}

execFunction()
{
 echo "===Config==="
 echo "Dir=$paramD"
 echo "Depth=$paramN"
 echo "===Init==="
 cd $paramD
 du -h --max-depth=$paramN
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
   echo "Max depth parameter is empty. Assuming max-depth = 1";
   paramN=1;
   execFunction
else
   execFunction
fi


