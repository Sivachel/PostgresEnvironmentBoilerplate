# Install required plugins
# Include plugin for "vagrant-berkshelf"
required_plugins = ["vagrant-berkshelf", "vagrant-ghost"]
required_plugins.each do |plugin|
    unless Vagrant.has_plugin? plugin
      puts "installing vagrant plugin #{plugin}"
      Vagrant::Plugin::Manager.instance.install_plugin plugin
      puts "installed vagrant plugin #{plugin}"
    end
end

Vagrant.configure("2") do |config|
  # APP Vagrant machine
  config.vm.define "app" do |app|
    app.vm.box = "ubuntu/xenial64"
    app.vm.network "private_network", ip: "192.168.10.100"
    app.ghost.hosts = ["development.local"]
    app.vm.synced_folder "app", "/home/ubuntu/app"
    app.vm.provision "chef_solo" do |chef|
      chef.add_recipe "sinatra::default"
      # chef.add_recipe "postgresql::default"
    end
    # If you need to run a provision script for your app, uncomment this code out to run it from the environment folder
    app.vm.provision "shell", path: "environment/app/provision.sh", privileged: false
  end

  # DB Vagrant machine
  config.vm.define "db" do |db|
    db.vm.box = "ubuntu/xenial64"
    db.vm.network "private_network", ip: "192.168.10.150"
    db.vm.network "forwarded_port", guest: 5432, host: 5431
    db.ghost.hosts = ["database.local"]
    db.vm.synced_folder "environment/db", "/home/ubuntu/environment"
    db.vm.provision "chef_solo" do |chef|
     chef.add_recipe "postgresql::default"
    end
    # If you need to run a provision script for your db, uncomment this code to run it from the environment folder
    db.vm.provision "shell", path: "environment/db/provision.sh", privileged: true
  end
end
