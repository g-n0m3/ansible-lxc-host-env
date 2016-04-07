# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

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
    ansible.playbook = "provisioning/ansible/site.yml" # let the games begin
  end
end
