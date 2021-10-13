#!/usr/bin/env bash
## -------------------------------------------
## all package related to PHP web development
## -------------------------------------------
. print.sh

## -------------------------------------------
## PHP version: 13.Oct.2021
## -------------------------------------------
brew tap shivammathur/php
# todo: check if php7.4 | php8.0 existing
if [ -d "//usr/local/opt/php@7.4" ]; then
  print_warning "php@7.4 already installed"
else
  brew install shivammathur/php/php@7.4
fi
if [ -d "//usr/local/opt/php@8.0" ]; then
  print_warning "php@8.0 already installed"
else
  brew install shivammathur/php/php@8.0
fi

## -------------------------------------------
## Composer V2.1.9: 13.oct.2021
## -------------------------------------------
brew install composer
