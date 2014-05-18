#!/bin/sh

# ===================================================================
# Due to an issue with a missing symlink in VB GuestAdditions 4.3.10
# during an initial 'vagrant up' an error occurs when trying to
# access shared folders.
#
# The issues explained here: https://www.virtualbox.org/ticket/12879
#
# To enable this box to be destroyed and remove the need to manually
# add the symlink on the box during a 'vagrant up' this script will:
# - Catch the known error
# - SSH to the Vagrant instance and add the missing symlink
# - Stop the Vagrant instance
# - Perform a 'vagrant up' with an explicit provision
# ===================================================================

# Environment variable passed to Vagrant instance
export GIT_USER="Your Name"
export GIT_USER_EMAIL=you@example.com
export RSPEC_EXAMPLES_REPO=git@github.com:username/github-repo.git

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

# Expect this to fail due to VB GuestAdditions issue (4.3.10)
echo 'Doing initial vagrant up - Failure expected!'
VAGRANT_LOG=info vagrant up
if [ "$?" = "0" ]; then
  echo "You may not be using VB GuestAdditons 4.3.10 so don't need to use this script!"
  exit 1
else
  echo "Due to VB GuestAdditions 4.3.10 missing a symlink - we need to add it explicitly!"
fi

echo 'Adding missing symlink to Vagrant VirtualBox instance'
VAGRANT_LOG=info vagrant ssh \
  -c 'sudo ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions' \
  || error_exit "ERROR $LINENO: Failed to add missing symlink for VB GuestAddition 4.3.10"

echo 'Halting the Vagrant instance'
VAGRANT_LOG=info vagrant halt || error_exit "ERROR $LINENO: Vagrant failed to shutdown the RSpec Box!"

echo 'Performing vagrant up with an explicit provision'
VAGRANT_LOG=info vagrant up --provision || error_exit "ERROR $LINENO: Vagrant failed to initialize the RSpec Box!"