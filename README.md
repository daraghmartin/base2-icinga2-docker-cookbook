# base2-icinga2-docker-cookbook
Cookbook to install and manage icinga2 docker

##Bake
run mount if you need (optional)

include_recipe "base2-icinga2-docker::mount"

run install

include_recipe "base2-icinga2-docker::install"

##Runtime
run run

include_recipe "base2-icinga2-docker::run"
