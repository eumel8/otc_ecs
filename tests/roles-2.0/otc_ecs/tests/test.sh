#!/bin/sh

echo "SCENARIO 1: create ECS"
ansible-playbook test.yml -e "ecs_name=ansible-test02 localaction=create waitfor=True" || exit 1
echo "SCENARIO 2: show ECS FLAVORS"
ansible-playbook test.yml -e "ecs_name=ansible-test02 localaction=flavors" || exit 1
echo "SCENARIO 3: show ECS"
ansible-playbook test.yml -e "ecs_name=ansible-test02 localaction=show" || exit 1
echo "SCENARIO 4: list ECS"
ansible-playbook test.yml -e "localaction=list" || exit 1
echo "SCENARIO 5: delete ECS"
ansible-playbook test.yml -e "ecs_name=ansible-test02 localaction=delete waitfor=True" || exit 1
# possible SCENARIO: ecs_fileinject, ecs_user_data
