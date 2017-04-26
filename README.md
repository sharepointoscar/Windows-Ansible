
# Ansible Examples
----------------

This repository contains examples and best practices for building Ansible Playbooks.

## Build the Windows 2016 Box
To build the Windows Server, we use Packer.  There are three providers in the vagrant template `vmware-fusion` `vmware-workstation` and `virtualbox-iso`

Here is how you build the virtualbox box using packer by specifying the template json file.

```bash
  packer build --only=virtualbox-iso windows_2016.json
```

## Running Tests
First, vagrant-serverspec is required, you can install it by executing `vagrant plugin install vagrant-serverspec`

Next, execute `vagrant up` and the since we added the _serverspec_ provisioner within our vagrantfile like so

```bash
config.vm.provision :serverspec do |spec|
    spec.pattern = 'spec/oscar-ansible-windows2016/check_features_spec.rb'
end
```
our tests will run.
