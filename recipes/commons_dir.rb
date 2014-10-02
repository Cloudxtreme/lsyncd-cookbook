directory node['lsyncd']['conf-d_dir'] do
  mode '0755'
  owner node['lsyncd']['user']
  action :create
  recursive true
end
