#!/usr/bin/env bash
is_composer_installed () {
  composer -v > /dev/null 2>&1
  COMPOSER=$?
  if [ $COMPOSER -ne 0 ]; then
    return false,
  else
    return true;
  fi
}
