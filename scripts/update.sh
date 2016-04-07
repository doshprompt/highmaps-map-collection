#!/bin/bash

set -e # exit with nonzero exit code if anything fails

# inside this git repo we'll pretend to be a new user
#git config user.name "Travis CI"
#git config user.email "rahuld223@yahoo.com"

if ! git diff-index --quiet HEAD; then
	# The first and only commit to this new Git repo contains all the
	# files present with the commit message "auto-update maps collection".
	git add .
	git commit -m "auto-update maps collection"

	# Force push from the current repo's master branch to the remote
	# repo's master branch. (All previous history on the master branch
	# will be lost, since we are overwriting it.) We redirect any output to
	# /dev/null to hide any sensitive credential data that might otherwise be exposed.
	git push > /dev/null 2>&1
fi