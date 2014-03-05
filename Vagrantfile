# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu-12.04-amd64"
  config.vm.box_url = "http://cloud-images.ubuntu.com/precise/current/precise-server-cloudimg-vagrant-amd64-disk1.box"

  config.vm.synced_folder "./", "/root/.chefvm"

  config.vm.define "bash" do |bash|
    bash.vm.provision :shell, path: "test/test.sh"
  end

  config.vm.define "fish" do |fish|
    fish.vm.provision :shell do |s|
      s.path = "test/test.sh"
      s.args = "fish"
    end
  end
end
