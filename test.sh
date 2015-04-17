#!/bin/sh

ansible-galaxy install -r requirements.yml --force
vagrant up
