#!/usr/bin/env bash
present_branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
if [ "$present_branch" != "main" ]; then
  echo "WARNING: You are on branch $present_branch, NOT main."
fi
echo "Fetching merged branches..."
git remote prune origin
remote_branches=$(git branch -r --merged | grep -v '/main$' | grep -v "/$present_branch$")
local_branches=$(git branch --merged | grep -v 'main$' | grep -v "$present_branch$")
if [ -z "$remote_branches" ] && [ -z "$local_branches" ]; then
  echo "No existing branches have been merged into $present_branch."
else
  echo "This will remove the following branches:"
  if [ -n "$remote_branches" ]; then
    echo "$remote_branches"
  fi
  if [ -n "$local_branches" ]; then
    echo "$local_branches"
  fi
  echo "====================="
  echo "staging & develop will not be deleted"
  read -p "Delete? (y/n): " -n 1 selection
  echo
  if [ "$selection" == "y" ] || [ "$selection" == "Y" ]; then
    # delete remote branches
    git push origin `git branch -r --merged | grep -v '/main$' | grep -v "/$present_branch$" | grep -v "develop" |grep -v "staging"|sed 's/origin\//:/g' | tr -d '\n'`
    # delete local branches
    git branch -d `git branch --merged | grep -v 'main$' |grep -v "develop" |grep -v "staging"| grep -v "$present_branch$" | sed 's/origin\///g' | tr -d '\n'`
  else
    echo "No Branches Were deleted."
  fi
fi
