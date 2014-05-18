#!/bin/sh

# ===================================================================
# GitHub configuration for this Vagrant virtual instance
#
# This script will:
# - Ensure the GitHub authentication exists in known_hosts file
# - Clone the RSpec Example repository
# - Configure Git user information
#
# It is used in conjunction with ssh-agent forwarding to provide
# a virtual environment usable by multiple users. It relies on three
# parameters being passed to the script:
# 1. Git User ("Your Name")
# 2. Git User Email Address (you@example.com)
# 3. Rspe Examples Repository (git@github.com:user/repo.git)
# ===================================================================

git_user=$1
git_user_email=$2
rspec_example_repo=$3

PROGNAME=$(basename $0)

error_exit() {

# -------------------------------------------------------------------
# Function for exit due to fatal program error
#         Accepts 1 arguement:
#                 string containing descriptive error message
# -------------------------------------------------------------------

  echo "${PROGNAME}: ${1:-"Unknown Error"}" 1>&2
  exit 1

}

# Enable automated Github authentication
echo 'Adding GitHub RSA key to known_hosts file'
ssh-keyscan -H github.com > ~/.ssh/known_hosts || \
  error_exit "ERROR $LINENO: Failed to add missing symlink for VB GuestAddition 4.3.10"

echo 'Cloning the RSpec Example repository'
git clone $rspec_example_repo || error_exit "ERROR $LINENO: Failed to clone RSpec Example repository!"

echo 'Configuring Git user'
git config --global user.name $git_user || error_exit "ERROR $LINENO: Failed to configure Git user!"
git config --global user.email $git_user_email || error_exit "ERROR $LINENO: Failed to configure Git user email!"