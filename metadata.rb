name 'lsyncd'
maintainer 'Syam Sampatsing'
maintainer_email 'syam@icemobile.com'
license 'none'
description 'Installation of lsyncd'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
begin
  version IO.read(File.join(File.dirname(__FILE__), 'VERSION'))
rescue
  version '0.0.1'
end
