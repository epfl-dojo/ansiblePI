# Ansible Pi


## Usage

`ansible-playbook -i inventory/hosts.yml playbook.yml`


Ou si on veut le faire tourner seulement sur la machine *tacticsch*

```
ansible-playbook -i inventory/hosts.yml playbook.yml -l tacticsch
```

Ou encore si on veut faire tourner seulement le *tag* 'test'

```
ansible-playbook -i inventory/hosts.yml playbook.yml -l tacticsch --tags "test"
```

