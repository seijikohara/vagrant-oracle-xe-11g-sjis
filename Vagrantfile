# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "CentOS-6.4-x86_64"
  config.vm.box_url = "https://dl.dropboxusercontent.com/u/3318148/vagrant/CentOS-6.4-x86_64-v2.box"

  config.vm.hostname = "oracle.local"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  # ansible is not supported on windows, so we bootstrap it in VM and run the playbooks
  require 'rbconfig'
  is_windows = (RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/)
  if is_windows
    config.vm.provision "shell" do |sh|
      sh.path = "provisioning/windows.sh"
      sh.args = "provisioning/ansible.yml provisioning/inventory"
    end
  else
    config.vm.provision "ansible" do |ansible|
      ansible.playbook = "provisioning/ansible.yml"
    end
  end

  # network configure
  config.vm.network "private_network", ip: "192.168.56.10"
  config.vm.network "forwarded_port", guest: 8080, host: 8080, auto_correct: true
  config.vm.network "forwarded_port", guest: 1521, host: 1521, auto_correct: true
end
