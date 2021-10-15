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
  print_warning "already installed: php@7.4"
else
  brew install shivammathur/php/php@7.4
fi
if [ -d "//usr/local/opt/php@8.0" ]; then
  print_warning "already installed: php@8.0"
else
  brew install shivammathur/php/php@8.0
fi

## -------------------------------------------
## Composer V2.1.9: 13.oct.2021
## -------------------------------------------
composer --help | grep 'Usage:' &> /dev/null
if [ $? == 0 ]; then
  print_warning "already installed: composer"
else
  brew install composer
fi

## -------------------------------------------
## riendsofphp/php-cs-fixer
## -------------------------------------------
composer global show | grep 'friendsofphp/php-cs-fixer' &> /dev/null
if [ $? == 0 ]; then
  print_warning "already installed: php-cs-fixer"
else
  composer global require friendsofphp/php-cs-fixer
  cp ../templates/php-cs-fixer.php ~/.php-cs-fixer.php
  print_success "install php-cs-fixer globally"
fi

## -------------------------------------------
## phpstan/phpstan
## -------------------------------------------
composer global show | grep 'phpstan/phpstan' &> /dev/null
if [ $? == 0 ]; then
  print_warning "already installed: phpstan/phpstan"
else
  composer global require phpstan/phpstan
  cp ../templates/phpstan.neon ~/.phpstan.neon
  print_success "install phpstan globally"
fi

## -------------------------------------------
## nunomaduro/phpinsights
## -------------------------------------------
composer global show | grep 'nunomaduro/phpinsights' &> /dev/null
if [ $? == 0 ]; then
  print_warning "already installed: nunomaduro/phpinsights"
else
  composer global require nunomaduro/phpinsights --with-all-dependencies
  cp ../templates/phpstan.neon ~/.phpstan.neon
  print_success "install nunomaduro/phpinsights globally"
fi