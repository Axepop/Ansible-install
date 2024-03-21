#!/bin/bash

// Install Docker container engine
sudo dnf install yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker
sudo docker version


//install Install Python 3.9 and Other Dependencies and pip install pacakage manager
sudo dnf  install python3-pip
sudo pip3 install --upgrade pip


//Install Ansible and Navigator
sudo pip3 install setuptools-rust wheel
sudo python -m pip install ansible

//Verify the Ansible Installation
mkdir project-ansible
cd project-ansible
sudo nano ansible.cfg
sudo cat | ./ansible.cfg <<-EOF
[defaults]

inventory      = /home/nouf-admin/project-ansible/inventory

remote_user = nouf-admin

host_key_checking = False


[privilege_escalation]

become=True

become_method=sudo

become_user=root

become_ask_pass=False

EOF


sudo nano inventory
sudo cat | ./ansible.cfg <<-EOF
[Hostserver1]
192.168.0.59

[Hostserver2]
192.168.0.59

EOF

ssh-keygen -A -N new_passphrase