SHELL := /bin/bash

help:
	# shellcheck disable=SC2046
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$|(^#--)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m %-43s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m #-- /[33m/'

.PHONY: help
.DEFAULT_GOAL := help

#-- Available commands
php_install: ## install PHP WebDev necessary packages
	cd src/ && bash php_installer.sh

phps: ## PHP version switcher that switch PHP version easily on macOS
	curl -L https://raw.githubusercontent.com/vikbert/shellhero/main/src/phps.sh > /usr/local/bin/phps
	chmod +x /usr/local/bin/phps
	phps

gbclean: ## clean up unused merged branches from remote and local copies
	curl -L https://raw.githubusercontent.com/vikbert/shellhero/main/src/git_branch_clean.sh > /usr/local/bin/gbclean
	chmod +x /usr/local/bin/gbclean

psysh: ## clean up unused merged branches from remote and local copies
	cd src && bash psysh.sh


