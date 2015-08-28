#!/bin/sh 
result=`df -H | grep "/dev/xv" | awk '{ print $5 }'|sed 's/%//'`;

  usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1  )
  partition=$(echo $output | awk '{ print $2 }' )
  if [ "$result" -ge 92 ]; then
    echo "Running out of space $result" 
    echo "Running out of space /dev/xvd1 $result% on $(hostname) as on $(date)" |mail -s "Alert: Almost out of disk space $result%" info@k.ie
   
 echo "Running out of space /dev/xvd1 $result% on $(hostname) as on $(date)" |mail -s "Alert: Almost out of disk space $result%" u5Zfg1AJAxuEo7s13yqe7@aphi
  else
   echo "disk ok $result% remaining on /dev/xvda1"
  fi

