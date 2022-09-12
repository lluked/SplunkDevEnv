Vagrant.configure("2") do |config|

  config.vm.provider "virtualbox" do |virtualbox|
    virtualbox.gui = true
    virtualbox.memory = 4096
    virtualbox.cpus = 1
  end

  config.vm.synced_folder ".", "/vagrant"

  config.vm.define "redhat" do |redhat|
    redhat.vm.box = "local/centos7"
    redhat.vm.network "forwarded_port", guest: 8000, host: 8000
    redhat.vm.provider "virtualbox" do |virtualbox|
      virtualbox.name = "Splunk-Dev"
    end
  end

  config.vm.provision :ansible_local do |ansible|
    ansible.playbook = "ansible/site.yml"
    ansible.config_file = "ansible/ansible.cfg"
  end

end
