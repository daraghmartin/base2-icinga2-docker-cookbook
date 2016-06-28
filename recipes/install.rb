package 'tmux'

package 'libcgroup'

service 'cgconfig' do
  action [:enable, :start]
end

package "docker"

service 'docker' do
  action [:enable, :start]
end

include_recipe "base2-icinga2-docker::build_container"
