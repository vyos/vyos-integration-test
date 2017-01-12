# vyos-integration-test

VyOS integration test with Vagrant, KVM and Serverspec.

## Setup

* Install Vagrant
* Install Vagrant plugins

    ```
    vagrant plugin install vagrant-vyos
    vagrant plugin install vagrant-libvirt
    ```
* Run `bundle`

## Run test

```
rake spec
```
