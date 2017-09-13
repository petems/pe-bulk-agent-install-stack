#! /bin/bash
#
#
#

if [ -f /etc/redhat-release ]; then
  yum install -y git
elif [ -f /etc/debian_version ]; then
  apt install -y git
else
  echo 'The git role only works on Debian or RedHat systems!'
  exit 1
fi

git clone https://github.com/puppetlabs/puppetlabs-pe_bulk_agent_install /etc/puppetlabs/code/modules/pe_bulk_agent_install
chown -R pe-puppet:pe-puppet /etc/puppetlabs/code/modules/pe_bulk_agent_install

/opt/puppetlabs/puppet/bin/gem install chloride --no-ri --no-rdoc
