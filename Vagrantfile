# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "puppetlabs/centos-6.5-64-puppet"

  config.vm.network "forwarded_port", guest: 9000, host: 9876
  config.vm.network "forwarded_port", guest: 5432, host: 5432
  config.vm.synced_folder "./ebook-project", "/vagrant"

  config.vm.provision :shell do |shell|
    shell.inline = "yum install -y java-1.7.0-openjdk java-1.7.0-openjdk-devel screen;
                    puppet module install puppetlabs/postgresql;
                    puppet module install maestrodev-wget;
                    puppet module install panaman-pathmunge"
  end

  config.vm.provision "puppet" do |puppet|
     puppet.manifests_path = "puppet/manifests"
     puppet.manifest_file  = "pgsql.pp"
   end

  config.vm.provision "puppet" do |puppet|
     puppet.manifests_path = "puppet/manifests"
     puppet.manifest_file  = "play2.pp"
     puppet.facter = {
      "activatorversion" => "1.2.10"
     }
   end

  config.vm.provision "shell", inline: "service iptables stop; cd /vagrant; screen -d -m activator run",
    run: "always"

end
