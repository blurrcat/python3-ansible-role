#!/bin/sh

bold=`tput bold`
normal=`tput sgr0`
red=`tput setaf 1`
green=`tput setaf 2`

# Retrieve and install any required Ansible roles from Ansible Galaxy.
ansible-galaxy install -r requirements.yml --force

# Provision the Vagrant machine with Ansible.
vagrant up

# Rerun the same Ansible playbook to test for idempotency.
ansible-playbook test.yml -i vagrant-inventory \
  -u vagrant --private-key=.vagrant/machines/ap/virtualbox/private_key \
  -e '@local_test_vars.yml' -vv | grep -q 'changed=0.*failed=0' \
    && (echo "Idempotence test: ${bold}${green}pass${normal}" && exit 0) \
    || (echo "Idempotence test: ${bold}${red}fail${normal}" && exit 1)
