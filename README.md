# Equinauts environments setup

### Goal
The goal of this repository is allow any Equinauts team member to setup a development environment ready to launch the system at localhost; and to setup a test instance at any Ubuntu Linux machine (also ready to launch the system), cloud service provider independent.

### Tools
In order to do so, we work with:
- [Vagrant](https://www.vagrantup.com/). A cross-platform development environments manager. Vagrant requires support from a virtualization tool, VirtualBox is suggested. With Vagrant, we aim to standardize the development environment where our system runs.

  - Vagrant box details:
    - Box: 'ubuntu/trusty64', version '20170811.0.1' (Official Ubuntu server).
    - OS: Ubuntu 14.04.5.
    - RAM: 2GB.
    - Cpus: 2.
    - Forwarded ports: 5000.
    - Provisioned by: 'chef-solo'.


- [Chef](https://www.chef.io/chef/). Code-based infrastructure manager. We use Chef to setup both the development and test environments from a single source.

  - Packages installed by Chef:
    - Node JS v6.11.2.
    - Git v2.14.1.
    - Yarn v0.27.5.

### Repository structure

- **Vagrantfile.** Here we find the development machine configuration. OS, memory, ports, etc. And also there's a section for 'provisioning', which is where we plug in Chef so it's [recipes](https://docs.chef.io/recipes.html) get executed (see below).

- **setup.sh.** Bash script to be executed at any Ubuntu Linux to setup the environment.

- **/cookobooks.** Here we find all the dependencies our [cookbook](https://docs.chef.io/cookbooks.html) works with, and the cookbooks it installs. Given we work with 'chef-solo' at the test instances too, we need all the dependencies commited because chef-solo does not look for anything in the internet.

### Joining the pieces

#### Development environment
- Host details:
  - OS: Ubuntu 16.04.
  - VirtualBox v5.1.22.
  - Vagrant v1.9.8.


- Installation:
  (The following commands assume you have Vagrant and VirtualBox installed in your machine and that you've a copy of this repository somewhere in your file system).
  - in a terminal, `cd /path/to/node-box`.
  - run `vagrant up`.

#### Test environment

- **setup.sh** will look for this same repository at Github. Given this repository is private, we need to find a way to authenticate the Linux instance to Github. One way to do that is generate a ssh key, add it to Github, and then perform ['ssh agent forwarding'](https://developer.github.com/v3/guides/using-ssh-agent-forwarding/). After doing this, we can:

  - Copy the file to the instance. `scp` is the suggested tool.
  - Don't forget giving execution permissions: `chmod +x setup.sh`.
  - run it `./setup.sh`.

** Allow traffic on the port where NodeJS is running (cloud provider specific). **
