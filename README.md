andrewrothstein.cluster_api
=========

![Build Status](https://github.com/andrewrothstein/ansible-cluster_api/actions/workflows/build.yml/badge.svg)

Installs [clusterctl](https://github.com/kubernetes-sigs/cluster-api).

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.cluster_api
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
