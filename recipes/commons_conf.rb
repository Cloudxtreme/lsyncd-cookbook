template node['lsyncd']['conf-file'] do
  source 'lsyncd.conf.lua.erb'
  owner 'root'
  group node['root_group']
  mode '0644'
  notifies :reload, 'service[lsyncd]'
end
