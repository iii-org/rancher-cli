#!/bin/bash
interval=1
while [ $interval -lt 129 ];
do
  kubectl get deployment --namespace $namespace |
  while IFS= read -r line;
  do
    if [[ $line == $deploy_name* ]];
      then
      echo $line
      for ele in $line
      do
        if [[ $ele == */* ]];
        then
          IFS='/' read -ra count <<< "$ele"
          if [ ${count[0]} == ${count[1]} ]; then exit 1; fi;
          echo Retry in ${interval}s...
          sleep $interval
          exit 2
        fi
      done
    fi
  done
  result=$?
  if [ $result == 1 ]; then
   echo $deploy_name deployed!
   exit 0
  fi
  if [ $result == 0 ]; then
    echo Deployment name $deploy_name not found!
    exit 1
  fi
  interval=$(($interval * 2))
done
