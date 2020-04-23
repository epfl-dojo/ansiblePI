# Ansible Pi
<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Ansible Pi](#ansible-pi)
	- [Usage](#usage)
		- [Examples](#examples)
		- [Only on one host](#only-on-one-host)
		- [Specifying a tag](#specifying-a-tag)
		- [Skip pecifying multiple tags](#skip-pecifying-multiple-tags)
		- [Both](#both)
	- [Notes](#notes)
		- [Failed to set permissions on the temporary files Ansible needs to create when becoming an unprivileged user](#failed-to-set-permissions-on-the-temporary-files-ansible-needs-to-create-when-becoming-an-unprivileged-user)

<!-- /TOC -->

## Usage

```
ansible-playbook -i inventory/hosts.yml playbook.yml
```


### Examples

### Only on one host
```
ansible-playbook -i inventory/hosts.yml playbook.yml -l hostentry
```

### Specifying a tag
```
ansible-playbook -i inventory/hosts.yml playbook.yml -t "test"
```

### Skip specifying a tag
```
ansible-playbook -i inventory/hosts.yml playbook.yml --skip-tags "github_key_import"
```

### Skip specifying multiple tags
```
ansible-playbook -i inventory/hosts.yml playbook.yml --skip-tags "ssh_users_key, ssh_dojo_key, ssh_root_key"
```

### Both
```
ansible-playbook -i inventory/hosts.yml playbook.yml -l hostentry -t "test"
```

## Notes

### Failed to set permissions on the temporary files Ansible needs to create when becoming an unprivileged user

If you get an error similar to:  
```
fatal: [ponsfrilus]: FAILED! => {"msg": "Failed to set permissions on the temporary files Ansible needs to create when becoming an unprivileged user (rc: 1, err: chown: changing ownership of '/var/tmp/ansible-tmp-1586959025.216097-122038295697183/': Operation not permitted\nchown: changing ownership of '/var/tmp/ansible-tmp-1586959025.216097-122038295697183/AnsiballZ_stat.py': Operation not permitted\n}). For information on working around this, see https://docs.ansible.com/ansible/become.html#becoming-an-unprivileged-user"}
```
be sure that the `acl` package is installed on the host.

It's also can be workarounded with an `ansible.cfg` file in the project's root, with:  
```
[defaults]
allow_world_readable_tmpfiles=true
```
