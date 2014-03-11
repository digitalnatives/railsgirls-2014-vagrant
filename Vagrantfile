# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise32"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  # networking
  config.vm.network :forwarded_port, host: 3000, guest: 3000 # rails app
  config.vm.network :forwarded_port, host: 4000, guest: 4000 # octopress sinatra app
  config.vm.network :forwarded_port, host: 57575, guest: 57575 # butterfly
  
  config.berkshelf.enabled = true

  # customization
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", 512]
  end

  # provisioning
  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "build-essential"
    chef.add_recipe "apt::default"
    chef.add_recipe "mc"
    chef.add_recipe "python"
    # chef.add_recipe "zsh"
    # chef.add_recipe "vagrant-zsh"
    # chef.add_recipe "oh-my-zsh"
    chef.add_recipe "git::source"
    chef.add_recipe "curl"
    chef.add_recipe "ntp"
    chef.add_recipe "rvm::default"
    chef.add_recipe "rvm::user"

    chef.json = {
      :rvm => {
        # version, branch, intaller_url because: https://github.com/fnichol/chef-rvm/issues/159
        :version => "1.25.19",
        :branch => "none",
        :installer_url => "https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer",
        :user_installs => [
          {
            'user'          => 'vagrant',
            'default_ruby'  => 'ruby-1.9.3-p194',
            'rubies'        => ['ruby-1.9.3-p194']
          }
        ]
      },
      :git => {
        :version => '1.8.5.3'
      },
      :oh_my_zsh => {
        :users => [{
          :login => 'vagrant',
          :theme => 'af-magic',
          :plugins => %w{git rails ruby rvm sublime virtualenv vagrant}
        }]
      }
    }
  end  
  
  config.vm.provision :shell, :path => "bootstrap.sh"

end
