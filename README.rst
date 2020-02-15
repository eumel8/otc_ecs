otc_ecs
=======

OTC role for ECS.

Variables:
^^^^^^^^^^

+---------------------------+---------------------------------------------------------------+
| Name                      | Description                                                   |
+===========================+===============================================================+
| localaction=flavors       | show flavors                                                  |
+---------------------------+---------------------------------------------------------------+
| ecs_name                  | name of ECS                                                   |
+---------------------------+---------------------------------------------------------------+
| ecs_id                    | id of ECS                                                     |
+---------------------------+---------------------------------------------------------------+
| ecs_volumetype            | Volume type of ECS (SATA,SSD,SAS)                             |
+---------------------------+---------------------------------------------------------------+
| ecs_volumesize            | Size of ECS volume in GB (or image default)                   |
+---------------------------+---------------------------------------------------------------+
| ecs_ram                   | RAM size of ECS (int)                                         |
+---------------------------+---------------------------------------------------------------+
| ecs_vcpus                 | CPU core of ECS (string)                                      |
+---------------------------+---------------------------------------------------------------+
| flavor_id                 | flavor_id instead RAM/CPU value (string)                                      |
+---------------------------+---------------------------------------------------------------+
| ecs_ipaddress             | IP address of ECS                                             |
+---------------------------+---------------------------------------------------------------+
| ecs_fileinject_[1-5]      | Personal data (file injection)                                |
|                           | up to 5 files                                                 |
|                           | example: ansible-playbook -e "ecs_fileinject_1=/etc/hosts \   |
|                           | ecs_fileinject_data_1=$(base64 -w 0 hosts.txt)"               |
+---------------------------+---------------------------------------------------------------+
| ecs_fileinject_data_[1-5] |  Personal data (file injection)                               |
+---------------------------+---------------------------------------------------------------+
| ecs_user_data             | cloud-init user data file                                     |
|                           | example [...] -e "ecs_user_data=$(base64 -w 0 user-data.txt)" |
+---------------------------+---------------------------------------------------------------+
| ecs_adminpass             | Admin password ECS                                            |
+---------------------------+---------------------------------------------------------------+
| ecs_adminkey              | SSH key name of ECS                                           |
+---------------------------+---------------------------------------------------------------+
| waitfor                   | Wait for ECS creation (True or False)                         |
+---------------------------+---------------------------------------------------------------+

Functions:
^^^^^^^^^^

Create::

    ansible-playbook tenant_yml.yml -e "ecs_name=ansible-test01" -e "localaction=create"

    ansible-playbook tenant_ini.yml -e "ecs_name=ansible-test01" -e "localaction=create"

    ansible-playbook tenant_json.yml -e "ecs_name=ansible-test01" -e "localaction=create"


    ./grole otc_ecs; ansible-playbook roles.yml -e "ecs_name=ansible-test01" -e "ecs_ipaddress=192.168.9.27 -e "subnet_name=ansible-subnet02" -e "secgroup_name=default" -e "localaction=create_nic" -e "waitfor=true"

Ad hoc command to creates an additional Nic to an existing ECS with existing Subnet and Secgroup

Show::

    ./grole otc_ecs; ansible-playbook roles.yml -e "ecs_name=ansible-test01" -e "localaction=show"

List::

    ./grole otc_ecs; ansible-playbook roles.yml -e "localaction=list"

Delete::

    ./grole otc_ecs; ansible-playbook roles.yml -e "ecs_name=ansible-test01" -e "localaction=delete"

    ./grole otc_ecs; ansible-playbook roles.yml -e "ecs_name=ansible-test01" -e "ecs_ipaddress=192.168.9.27" -e "localaction=delete_nic" -e "waitfor=true"

Ad hoc command to delete an additional Nic (can't be the default Nic on an ECS)
