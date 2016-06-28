docker_image 'icinga/icinga2'

directory '/usr/src/icinga2'

template '/usr/src/icinga2/Dockerfile' do
  source 'docker/base2-icinga2.erb'
end

template '/usr/src/icinga2/services.conf' do
  source 'docker/services.conf.erb'
end

template '/usr/src/icinga2/base2-pagerduty-icinga2.conf' do
  source 'docker/base2-pagerduty-icinga2.conf.erb'
end

template "/usr/src/icinga2/base2icinga2pagerduty.rb" do
  source 'docker/base2icinga2pagerduty.rb.erb'
end

template "/usr/src/icinga2/check_base2.conf" do
  source 'docker/check_base2.conf.erb'
end

template "/usr/src/icinga2/include_extra.conf" do
  source 'docker/include_extra.conf.erb'
end

docker_image 'base2-icinga2' do
  tag node["base2"]["icinga2"]["container"]["tag"]
  source '/usr/src/icinga2'
  action :build_if_missing
end
