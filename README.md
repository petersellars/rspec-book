# RSpec-Book Virtual Environment

This project can be used to provision a virtual environment in which to carry
out the exampe code from 
'[The RSpec Book](http://pragprog.com/book/achbd/the-rspec-book)'.

[Vagrant](http://www.vagrantup.com) is used to provison the virtual 
environment. At this time only a [VirtualBox](http://www.virtualbox.org)
environment is created. This instance utilises the *precise64* base box 
provided [here](http://files.vagrantup.com/precise64.box).

Provisioning code to establish a Vagrant environment using Puppet with
Librarian-Puppet to create a box for building and running the code from
'The RSpec Book'

This box utilises several Vagrant plugins:
* vagrant-vbguests
* vagrant-hostsupdate
* vagrant-hosts
* vagrant-serverspec

vagrant provision --provision-with serverspec
vagrant provision --provision-with hosts

Uses SSH Agent Forwarding to enable GitHub access

### TODO:

* Test the box can run rspec and cucumber tests then Tag it!
* Check Vagrant multiple provisioner running - is it per file order? Multiple?
* Update the serverspec version in the vagrant-serverspec plugin
* Look at moving the librarian-puppet to manage the puppet module folder (use puppet module list)
* Utilise auto update so that a manual fix is not needed when using vagrant up (4.10)

### GitHub for storing the examples

Use SSH Agent Forwarding
- SSH Key generated on host machine (Used maestrodev/ssh_keygen and Puppet)
  - Manual https://help.github.com/articles/generating-ssh-keys
- Vagrantfile configuration for SSH Agent Forwarding
  - http://razius.com/articles/vagrant-and-ssh-agent-forwarding/
  - https://help.github.com/articles/using-ssh-agent-forwarding

Vagrant + SSH Key

git config --global user.name "Your Name"
git config --global user.email you@example.com

git clone

Following the initial-up pass the following from command line or use the rspec-up.sh and set values

GIT_USER='psellars' GIT_USER_EMAIL='psellars@gmail.com' vagrant up

Test it all works and when starting up the box the project is checked out and ready to go...

### Virtualbox 4.10 Guest Additions
If using Virtualbox 4.10 the Guest Additions fails to mount the shared folders.

An explanation of the issue can be found here: https://www.virtualbox.org/ticket/12879

There are 2 ways to fix this:

* Manually add the symlink provided in the issue
* Use a 4.11 Guest Additions versions, including a fix and turn off auto-update

Manual Fix

sudo ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions