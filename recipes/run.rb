# /etc/icinga2
# /etc/icingaweb2
#
# /var/lib/icinga2
# /usr/share/icingaweb2
#
# /var/lib/mysql
['/data/icinga2/conf.d/local', '/data/mysql/'].each do | dir |
  directory dir do
    recursive true
  end
end

docker_container 'base2-icinga2' do
  container_name 'base2-icinga2'
  tag 'v0.1.0'
  env [
    "ENVIRONMENT=#{node.chef_environment}"
  ]
  detach true
  binds ['/data/icinga2/conf.d/local:/etc/icinga2/conf.d/local', '/data/mysql:/var/lib/mysql']
  port '80:80'
  restart_policy 'always'
  action [:redeploy]
end

service 'docker' do
  action [:enable, :restart]
end
