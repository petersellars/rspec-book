#!/bin/sh

# ===================================================================
# Bash Script to bring up the Vagrant instance with logging
# ===================================================================

# Environment variable passed to Vagrant instance
export GIT_USER="Your Name"
export GIT_USER_EMAIL=you@example.com
export RSPEC_EXAMPLES_REPO=git@github.com:username/github-repo.git

echo 'Performing vagrant up with an explicit provision'
VAGRANT_LOG=info vagrant up --provision || error_exit "ERROR $LINENO: Vagrant failed to initialize the RSpec Box!"