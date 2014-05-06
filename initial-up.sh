#!/bin/bash

export GIT_USER="Your Name"
export GIT_USER_EMAIL=you@example.com

PROGNAME=$(basename $0)

function error_exit
{

# -------------------------------------------------------------------
# Function for exit due to fatal program error
#         Accepts 1 arguement:
#                 string containing descriptive error message
# -------------------------------------------------------------------

  echo "${PROGNAME}: ${1:-"Unknown Error"}" 1>&2
  exit 1

}

# Expect this to fail due to VB GuestAdditions issue
vagrant up
vagrant ssh -c 'sudo ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions'
vagrant halt || error_exit "Vagrant failed to shutdown the RSpec Box!"

vagrant up --provision || error_exit "Vagrant failed tvo initialize the RSpec Box!"