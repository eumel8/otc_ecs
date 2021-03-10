#!/bin/sh

echo "SCENARIO 1: create token IAM"
ansible-playbook test.yml || exit 1
