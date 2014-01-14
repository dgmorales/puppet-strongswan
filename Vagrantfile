# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.define :precise do |precise|
    precise.vm.box = "puppet-ubuntu-12.04.2-x64"
    precise.vm.hostname = "ubuntu-1204.vagrantup.com"
    #precise.vm.provision :puppet do |puppet|
    #  #puppet.puppet_node = "rtloja0.adm.lojasobino.com.br"
    #  puppet.manifests_path = "manifests"
    #  puppet.manifest_file = "site.pp"
    #  puppet.module_path = ["modules", "site-modules"] 
    #  puppet.options= "--hiera_config=/vagrant/hiera.yaml"
    #  #puppet.facter = {
    #  # "vagrant" => "1"
    #  #}
    #end
  end

  config.vm.define :centos64 do |centos64|
    centos64.vm.box = "puppet-centos-6.4-x64"
    centos64.vm.hostname = "centos64.vagrantup.com"
  end

  config.vm.synced_folder "..", "/puppet_modules"
end
