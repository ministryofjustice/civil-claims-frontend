Vagrant.configure("2") do |config|

    # select distribution
    config.vm.box = "centos6.4c"
    config.vm.box_url = "http://static.dsd.io/vagrant/centos6.4c.box"

    # for masterless salt: mount your salt file root and minion config
    config.vm.synced_folder "../salty-dsd/salt/roots/", "/srv/salt/"
    config.vm.synced_folder "../salty-dsd/civil-claims/pillar/", "/srv/pillar/"

    config.vm.network :forwarded_port, guest: 80, host: 8100
    config.vm.network :private_network, ip: "192.168.50.12"
    config.vm.synced_folder "../civil-claims-backend-data-api/", "/srv/civil-claims-backend-data-api/", :mount_options => ["dmode=775,fmode=664"]
    config.vm.synced_folder "../civil-claims-frontend-claimant/", "/srv/civil-claims-frontend-claimant/", :mount_options => ["dmode=775,fmode=664"]
    config.vm.synced_folder "../civil-claims-spec/", "/srv/civil-claims-spec/", :mount_options => ["dmode=775,fmode=664"]
    config.vm.synced_folder "../devise_authentication_api/", "/srv/devise_authentication_api/", :mount_options => ["dmode=775,fmode=664"]

    # To bootstrap machine using salt let's push role before salt.highstate runs
    config.vm.provision :fabric do |fabric|
        fabric.fabfile_path = "../salty-dsd/fabfile.py"
        fabric.tasks = [
            "provider:vagrant",
            "vagrant_bootstrap",
            "pushrole:civilclaims:civil-claims-front:civil-claims-api:civil-claims-auth:civil-claims-spec:mongodb",
        ]
    end

    # Time to execute salt state.highstate
    config.vm.provision :salt do |salt|
        salt.minion_config = "../salty-dsd/salt/minion"
        salt.verbose = true
        salt.run_highstate = true
    end
end