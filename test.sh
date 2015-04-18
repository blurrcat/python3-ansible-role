#!/bin/sh

# Retrieve and install any required Ansible roles from Ansible Galaxy.
ansible-galaxy install -r requirements.yml --force

# Provision the Vagrant machine with Ansible.
vagrant up

# Rerun the same Ansible playbook to check for idempotency.
ansible-playbook test.yml -i vagrant-inventory \
  -u vagrant --private-key=.vagrant/machines/ap/virtualbox/private_key \
  -e '@test_vars.yml' -vv
