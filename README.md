# Postgres & Sinatra Dev and Testing Environments

## Before setting up your environments:
1. Move your application into the app folder
2. Add any provision scripting for your app and db into the environment folder
3. Run `berks vendor cookbooks`, to pull down cookbooks to provision the environment

`NOTE: Make sure you have chef installed`

## Dev Environments
##### Set up your Dev Environment with Vagrant and VirtualBox
##### https://www.vagrantup.com/downloads.html
##### https://www.virtualbox.org/wiki/Downloads
##### Edit your Vagrantfile depending on your application
##### Set up your App or DB virtual machines by running:
```
vagrant up
vagrant ssh app / vagrant ssh db
```


## Testing Environments
##### Set up your Testing Environment by generating AMIs with Packer
##### https://www.packer.io/downloads.html
##### Edit packer-app.json depending on your application
##### Set up your App AMI by running:
```
packer validate packer-app.json
packer build packer-app.json
```
##### If you require a PostgreSQL Database, edit packer-db.json
##### Set up your DB AMI by running
```
packer validate packer-db.json
packer build packer-db.json
```

## Links for Cookbook Repos:
##### Ruby: https://github.com/spartaglobal/SinatraCookbook2019
##### Postgres: https://github.com/spartaglobal/PostgresCookbook2019
