#!/bin/bash

token=$(cat ~/.github_token)
curl -Is -H "Authorization: token ${token}" https://api.github.com/orgs/VeracityInnovations/repos | grep "^Link"
curl -s -H "Authorization: token ${token}" https://api.github.com/orgs/VeracityInnovations/repos | jq '.[].name'

for dir in ~/vix/*/
do
  cd ${dir}
  branch=$(git branch)
  if [[ ${branch} = *"* master"* ]]; then
    status=$(git status)
    if [[ ${status} = *"nothing to commit"* ]]; then
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
