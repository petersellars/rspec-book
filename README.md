Provisioning code to establish a Vagrant environment using Puppet with
Librarian-Puppet to create a box for building and running the code from
'The RSpec Book'

This box utilises several Vagrant plugins:
* vagrant-vbguests
* vagrant-hostsupdate
* vagrant-serverspec

vagrant provision --provision-with serverspec

### TODO:

* Test the box can run rspec and cucumber tests then Tag it!
* Look at moving the librarian-puppet to manage the puppet module folder (use puppet module list)
* Utilise auto update so that a manual fix is not needed when using vagrant up

### Virtualbox 4.10 Guest Additions
If using Virtualbox 4.10 the Guest Additions fails to mount the shared folders.

An explanation of the issue can be found here: https://www.virtualbox.org/ticket/12879

There are 2 ways to fix this:
* Manually add the symlink provided in the issue
* Use a 4.11 Guest Additions versions, including a fix and turn off auto-update