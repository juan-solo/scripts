#!/bin/bash -x

cd ~
elbadmin list > list
perl -i -pe '$_=""if 1..3' list 

for i in `cat list|awk '{print$1}'`
  do
    A=`elbadmin get $i|grep -cim1 OutOfService`
    i=$i
    if [ "$A" == "1" ]; then
      cd ~
      echo $i
      B=`elbadmin get $i|grep OutOfService`
      echo $B
      echo "ELB Critical INSTANCE out of service $B"|mailx -a  "From: ELB INSTANCE Alert <ELB-Alerts@blash.com>" -s  "ELB $i:Critical" "zap@blash.com"
       echo "ELB Critical INSTANCE out of service $B"|mailx -a  "From: ELB INSTANCE Alert <ELB-Alerts@blash.com>" -s  "ELB $i:Critical" "u5Zfg1AJAxuEo7s13yqe799mL3m4@api.net"
    fi
done
