#!/usr/bin/env bash

ansible-playbook playbook.yml -i inventory/hosts.yml --syntax-check

