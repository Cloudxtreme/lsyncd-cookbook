
default['lsyncd']['conf-d_dir'] = '/etc/lsyncd/conf.d'
default['lsyncd']['log_file'] = '/var/log/lsyncd/lsyncd.log'
default['lsyncd']['status_file'] = '/var/log/lsyncd/lsyncd-status.log'
default['lsyncd']['interval'] = 20
default['lsyncd']['maxDelays'] = 1

case node['platform_family']
when 'rhel'
  default['lsyncd']['install_method'] = 'package'
  default['lsyncd']['package_name'] = 'lsyncd'
  default['lsyncd']['package_version'] = '2.1.4-4.el6'
  default['lsyncd']['user']        = 'root'
  default['lsyncd']['conf-file'] = '/etc/lsyncd.conf'
else
  default['lsyncd']['install_method'] = 'package'
  default['lsyncd']['package_name'] = 'lsyncd'
  default['lsyncd']['package_version'] = '2.1.4-4.el6'
  default['lsyncd']['user']        = 'root'
  default['lsyncd']['conf-file'] = '/etc/lsyncd/lsyncd.conf.lua'
end

default['lsyncd']['group'] = node['lsyncd']['user']
