#!/usr/bin/env bash
GREEN='\033[32m' # success
CYAN='\033[0;36m' # info
GRAY='\033[0;37m' # info
YELLOW='\033[1;33m' # warning
RED='\033[1;31m' # error
NC='\033[0m' # No Color
bold=$(tput bold)
normal=$(tput sgr0)

print_success() {
    message="$1"
    echo
    echo -e "✅ $GREEN$message$NC";
}

print_info() {
    message="$1"
    echo
    echo -e "🗣  $CYAN$message$NC";
}

print_warning() {
    message="$1"
    echo
    echo -e "🔅 $YELLOW$message$NC";
}

print_error() {
    message="$1"
    echo
    echo -e "❌ $RED$message$NC";
}

print_hr() {
  echo -e "----------------------------------------------"
}

PRIMARY_BRANCH='main'
DRY_RUN=false

switch_branch() {
  PRIMARY_BRANCH="$1"
  #git stash
  git checkout $PRIMARY_BRANCH
  print_success "Switch to the ${bold}primary${normal} branch $PRIMARY_BRANCH"
}

select_primary_branch() {
    read -p "Which one is your ${bold}primary${normal} branch 1) main 2) master, 3) develop, Enter the number 1 2 or 3 ? " selection
    print_hr
    case $selection in
        [1]* ) switch_branch "main";;
        [2]* ) switch_branch "master";;
        [3]* ) switch_branch "develop";;
        * ) print_error "Please answer 1 or 2.";;
    esac
}

___detect_primary_branch_switched() {
  present_branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
  if [ "$present_branch" != "main" ]; then
  print_error "You are on branch '$present_branch', please switch to your primary branch: main | master";
  exit;
  fi
}

start_script() {
  if [ "$DRY_RUN" == true ]; then
    print_warning "DryRun mode is enabled and nothing will be deleted in dry-run mode!"
  fi
  select_primary_branch
}

if [ "$1" == "--dry-run" ]; then
  DRY_RUN=true
  start_script
else
  DRY_RUN=false
  start_script
fi


print_info "Fetching merged branches..."
git remote prune origin
remote_branches=$(git branch -r --merged | grep -v "/$PRIMARY_BRANCH$")
local_branches=$(git branch --merged | grep -v "$PRIMARY_BRANCH$")
if [ -z "$remote_branches" ] && [ -z "$local_branches" ]; then
  print_warning "No existing branches have been merged into $PRIMARY_BRANCH."
else
  if [ -n "$remote_branches" ]; then
    print_info "Found remote branches:"
    print_hr
    echo "$remote_branches"
  fi
  if [ -n "$local_branches" ]; then
    print_info "Found local branches:"
    print_hr
    echo "$local_branches"
  fi
  print_hr
  print_warning "master, main and develop will not be deleted"
  read -p "Delete? (y/n): " -n 1 selection
  echo
  if [ "$selection" == "y" ] || [ "$selection" == "Y" ]; then
    if [ "$DRY_RUN" == true ] ; then
      print_info "Dry-run: removable remote branches"
      git branch -r --merged | grep -v "main" | grep -v "/$PRIMARY_BRANCH$" | grep -v "develop" |grep -v "master"|sed 's/origin\//:/g' | tr -d '\n'
    else
      print_success "Deleting remote branches"
      git push origin `git branch -r --merged | grep -v "main" | grep -v "develop" | grep -v "master" | grep -v "/$PRIMARY_BRANCH$" | sed 's/origin\//:/g' | tr -d '\n'`
    fi

    if [ "$DRY_RUN" == true ] ; then
      print_info "Dry-run: removable local branches"
      git branch --merged | grep -v "main" | grep -v "/$PRIMARY_BRANCH$" | grep -v "develop" |grep -v "master" | sed 's/origin\//:/g' | tr -d '\n'
    else
      print_success 'Deleting local branch'
      git branch -d `git branch --merged | grep -v "main" | grep -v "develop" | grep -v "master" | grep -v "$PRIMARY_BRANCH$" | sed 's/origin\///g' | tr -d '\n'`
    fi

  else
    print_warning "No Branches Were deleted."
  fi
fi
