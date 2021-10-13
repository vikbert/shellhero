#!/usr/bin/env bash

. ./print.sh
. ./utils/is_installed.sh

COMPOSER_INSTALLED=$is_composer_installed
if [ is_composer_installed ]; then
  composer global require psy/psysh
  print_success "psysh is installed globally via composer"
else
  exit
fi
