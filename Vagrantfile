# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  # Place guest on the public network.  This will give the VM an IP address on
  # your local network.
  config.vm.network "public_network", type: "dhcp"

  config.vm.synced_folder ".", "/home/vagrant/workspace", type: "virtualbox"
  config.vm.synced_folder "~/.aws", "/home/vagrant/.aws", type: "virtualbox"

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false
 
    # Customize the amount of memory on the VM:
    vb.memory = "1024"
  end

  config.vm.provision "shell", inline: <<-SHELL
    # EPEL
    rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

    # Update
    yum update -y

  SHELL

  config.vm.provision :reload

  config.vm.provision "shell", inline: <<-SHELL
    yum install -y gcc kernel-devel kernel-headers dkms make bzip2 perl curl wget git unzip gcc-c++
    
    # Terraform
    git clone https://github.com/kamatama41/tfenv.git /home/vagrant/.tfenv
    ln -s ~/.tfenv/bin/* /usr/local/bin/

    # Node.js
    curl -sL https://rpm.nodesource.com/setup_6.x | sudo -E bash -
    yum install -y nodejs

    npm install -g npm
    npm install -g create-react-app
  SHELL
end
