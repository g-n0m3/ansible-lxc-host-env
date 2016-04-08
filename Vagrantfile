# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.define "web-01-dev" do |web01|
    web01.vm.hostname = "web-01-dev"
    web01.vm.network "private_network", ip: "192.168.169.170"
  end

  config.vm.define "dbx-01-dev" do |dbx01|
    dbx01.vm.hostname = "dbx-01-dev"
    dbx01.vm.network "private_network", ip: "192.168.169.171"
  end

  config.vm.synced_folder ".", "/vagrant"
   
  config.vm.provision "shell", path: "provisioning/shell/provision-base.sh"
  
  # Run Ansible from the Vagrant Host
  config.vm.provision "ansible" do |ansible|
    ansible.groups = {
      "dbx_hosts" => ["dbx-01-dev"],
      "web_hosts" => ["web-01-dev"]
     }
    ansible.inventory_path = "provisioning/ansible/inventory"
    ansible.limit = "all"   # change ansibles default limit to include all hosts
    ansible.verbose = "vvv" # spit out the specifics to help with troubleshooting in dev
    ansible.playbook = "provisioning/ansible/site.yml" # let the games begin
  end
end
