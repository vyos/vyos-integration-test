# vyos-integration-test

VyOS integration test with Vagrant, KVM and Serverspec.

## Setup

```
git clone https://github.com/higebu/vyos-integration-test.git
cd vyos-integration-test
./setup.sh
```

* Set vagrant box (default to higebu/vyos)

```
export VYOS_VAGRANT_BOX=vyos/current
```

## Run test

```
rake spec
```

## How it works

![how-it-works](https://raw.githubusercontent.com/higebu/vyos-integration-test/master/how_it_works.png)

## How to add a test case

TODO
