# /etc/icinga2
# /etc/icingaweb2
#
# /var/lib/icinga2
# /usr/share/icingaweb2
#
# /var/lib/mysql
binds = []
dirs = []
volumes = []

node["base2"]["icinga2"]["container"]["binds"].map { |k,v| dirs << k; volumes << v; binds << "#{k}:#{v}"}

dirs.each do | dir |
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
  binds binds
  port '80:80'
  restart_policy 'always'
  volumes volumes
  action [:redeploy]
end

service 'docker' do
  action [:enable, :restart]
end
