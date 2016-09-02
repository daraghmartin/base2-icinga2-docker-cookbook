package 'tmux'

package 'libcgroup'

unless node['base2']['environment']['platform'] == 'azure'
  service 'cgconfig' do
    action [:enable, :start]
  end
end

package "docker"

service 'docker' do
  action [:enable, :start]
end

include_recipe "base2-icinga2-docker::build_container"
