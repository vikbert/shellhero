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
