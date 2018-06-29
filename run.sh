#!/bin/bash

for dir in ~/vix/*/
do
  cd ${dir}
  branch=$(git branch)
  if [[ $branch = *"* master"* ]]; then
    status=$(git status)
    if [[ $status = *"nothing to commit"* ]]; then
      echo "DO PULL ~ $dir"
      git pull
    else
      echo "NEED TO COMMIT ~ $dir"      
    fi
  else
    echo "NOT ON MASTER ~ $dir"
  fi
  cd ..
done

