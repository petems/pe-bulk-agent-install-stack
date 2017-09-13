# pe-bulk-agent-install-stack

This project provides a batteries-included Vagrant environment for testing the pe-bulk-agent-install module

### Install Vagrant Plugins

Two methods are avaible depending on whether a global Vagrant installation, such as provided by the official packages from [vagrantup.com](http://vagrantup.com), is in use:

  - `rake setup:global`:
    This Rake task will add all plugins required by the debugging kit to a global Vagrant installation.

  - `rake setup:sandboxed`:
    This Rake task will use Bundler to create a completely sandboxed Vagrant installation that includes the plugins required by the debugging kit.
    The contents of the sandbox can be customized by creating a `Gemfile.local` that specifies additional gems and Bundler environment parameters.

You can also just run:

> vagrant plugin install oscar vagrant-pe_build vagrant-share vagrant-vbguest

### Demoing the bulk installer

Run the following:

> vagrant up pe-201647-master vanilla-centos-6

This will setup a 2016.4 PE Master, a vanilla CentOS 6 box without Puppet installed, and change the password for the vagrant user on the vanilla box to be `super-secret-password`

Then login to the master:

> vagrant ssh pe-201647-master

Then run the bulk install agent against vanilla-centos-6 box

> puppet bulk install vanilla-centos-6 --credentials /vagrant/sudo_install.json --trace --debug

The credentials file is in this root dir and should look like this:

```json
{
  "username": "vagrant",
  "sudo_password": "super-secret-password",
  "master" : "pe-201647-master"
}
```
