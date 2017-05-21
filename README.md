
# Ansible Examples on Windows Server 2016
----------------

This repository demonstrates:
- Using Packer to build a machine with specific configuration
- Using Vagrant to further configure the machine
- Using ServerSpec to run tests against your machine to ensure desired state configuration is in place

### About ServerSpec

>With Serverspec, you can write RSpec tests for checking your servers are configured correctly.

>Serverspec tests your servers’ actual state by executing command locally, via SSH, via WinRM, via Docker API and so on. So you don’t need to install any agent softwares on your servers and can use any configuration management tools, Puppet, Ansible, CFEngine, Itamae and so on.

But the true aim of Serverspec is to help refactoring infrastructure code.

## Build the Windows 2016 Box
To build the Windows Server, we use Packer.  There are three providers in the vagrant template `vmware-fusion` `vmware-workstation` and `virtualbox-iso`

Here is how you build the virtualbox box using packer by specifying the template json file.

```bash
  packer build --only=virtualbox-iso windows_2016.json
```

## Running Tests
First, **vagrant-serverspec** is required, you can install it by executing `vagrant plugin install vagrant-serverspec`

Next, execute `vagrant up` and the since we added the _serverspec_ provisioner within our vagrantfile like so

```bash
config.vm.provision :serverspec do |spec|
    spec.pattern = 'spec/oscar-ansible-windows2016/check_features_spec.rb'
end
```
our tests will run at the time the VM is spinning up.
