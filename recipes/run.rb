# /etc/icinga2
# /etc/icingaweb2
#
# /var/lib/icinga2
# /usr/share/icingaweb2
#
# /var/lib/mysql
node["base2"]["icinga2"]["container"]["bind_dirs"].each do | dir |
  directory dir do
    recursive true
  end
end

docker_container 'base2-icinga2' do
  container_name 'base2-icinga2'
  tag node["base2"]["icinga2"]["container"]["tag"]
  env [
    "ENVIRONMENT=#{node.chef_environment}"
  ]
  detach true
  binds node["base2"]["icinga2"]["container"]["binds"]
  port '80:80'
  restart_policy 'always'
  action [:redeploy]
end

service 'docker' do
  action [:enable, :restart]
end
