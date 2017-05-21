# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|

  ANSIBLE_RAW_SSH_ARGS = []
  config.vm.define "oscar-ansible-windows2016"
  config.vm.box = "sharepointoscar/windows_2016_virtualbox"
  config.vm.hostname = "windows2016Server"
  config.vm.communicator = "winrm"

  # credentials
  config.winrm.username = "vagrant"
  config.winrm.password = "vagrant"

  # insert the private key from the host machine to the guest
  ANSIBLE_RAW_SSH_ARGS << "-o IdentityFile=~/.vagrant.d/insecure_private_key"

  config.vm.guest = :windows
  config.vm.communicator = "winrm"
  config.windows.halt_timeout = 35

  config.vm.network "private_network", ip: "192.168.3.10"
  config.vm.network :forwarded_port, guest: 5985, host: 5985, id: "winrm", auto_correct: true
  config.vm.network :forwarded_port, guest: 3389, host: 3389, id: "rdp", auto_correct: true
  config.vm.network :forwarded_port, guest: 22, host: 2222, id: "ssh", auto_correct: true

  config.vm.synced_folder ".", "/vagrant"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
     vb.gui = true
     vb.name = "Oscar's Ansible Host (@SharePointOscar)"
     vb.customize ["modifyvm", :id, "--memory", 2048]
     vb.customize ["modifyvm", :id, "--cpus", 2]
     vb.customize ["modifyvm", :id, "--vram", 128]
     vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
     vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
     vb.customize ["modifyvm", :id, "--accelerate2dvideo", "on"]
  end

   config.vm.provision "shell", path: "scripts/openssh.ps1"

  config.vm.provision "ansible" do |ansible|
      ansible.limit = "webservers"
      ansible.playbook = "./windows/enable-iis.yml"
      ansible.inventory_path = "test.ini"
      ansible.verbose = "vvvv"
      ansible.raw_ssh_args = ANSIBLE_RAW_SSH_ARGS
  end

  config.vm.provision :serverspec do |spec|
      spec.pattern = 'spec/oscar-ansible-windows2016/check_features_spec.rb'
  end
end
