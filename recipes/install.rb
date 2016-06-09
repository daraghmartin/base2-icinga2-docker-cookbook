package 'tmux'

package 'libcgroup'

service 'cgconfig' do
  action [:enable, :start]
end

package "docker"

service 'docker' do
  action [:enable, :start]
end

docker_image 'icinga/icinga2'

directory '/usr/src/icinga2'

template '/usr/src/icinga2/Dockerfile' do
  source 'docker/base2-icinga2.erb'
end

docker_image 'base2-icinga2' do
  tag 'v0.1.0'
  source '/usr/src/icinga2'
  action :build_if_missing
end
