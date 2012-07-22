# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "precise64"

  config.vm.network :hostonly, "192.168.39.15"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "tests"
    puppet.module_path    = "../"
    puppet.manifest_file  = "init.pp"
  end

end
