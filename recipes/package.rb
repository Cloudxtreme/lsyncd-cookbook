package node['lsyncd']['package_name'] do
  action :install
  version node['lsyncd']['package_version']
end

include_recipe 'lsyncd::commons_dir'
include_recipe 'lsyncd::commons_conf'

service 'lsyncd' do
  supports status: 'true', restart: 'true', reload: 'true'
  action :enable
end
