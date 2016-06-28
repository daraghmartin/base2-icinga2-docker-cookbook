# /etc/icinga2
# /etc/icingaweb2
#
# /var/lib/icinga2
# /usr/share/icingaweb2
#
# /var/lib/mysql
binds = []
dirs = []

node["base2"]["icinga2"]["container"]["binds"].map { |k,v| dirs << k; binds << "#{k}:#{v}"}

dirs.each do | dir |
  directory dir do
    recursive true
  end
end

if node["base2"]["icinga2"]["check_base2"]
  template "/data/opt/base2/icinga2/conf.d/check_base2.conf" do
    source 'docker/check_base2.conf.erb'
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
