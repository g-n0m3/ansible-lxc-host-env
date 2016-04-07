# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.31.13"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.

  config.vm.define "web-01_dev"
#  config.vm.define "web-01_tst"
#  config.vm.define "web-01_pro"
  config.vm.define "dbx-01_dev"
#  config.vm.define "dbx-01_tst"
#  config.vm.define "dbx-01_pro"

  config.vm.synced_folder ".", "/vagrant"
   
  config.vm.provision "shell", path: "provisioning/shell/provision-base.sh"
  
  # Run Ansible from the Vagrant Host
  config.vm.provision "ansible" do |ansible|
    ansible.groups = {
      "dbx_hosts" => ["db-[0:2]_dev"],
      "lxc_hosts" => ["web-01_dev"],
      "web_hosts" => ["web-01_dev"]
     }
    ansible.limit = "all"   # change ansibles default limit to include all hosts
    ansible.verbose = "vvv" # spit out the specifics to help with troubleshooting in dev
    ansible.playbook = "provisioning/ansible/plays/site.yml" # let the games begin
  end
end
