#! /bin/bash

if [ -e /usr/bin/ansible ]
then
  echo "Ansible is already installed"
else
  sudo dnf -y install ansible-core
fi

cd ansible-playbooks
ansible-playbook setup.yml
