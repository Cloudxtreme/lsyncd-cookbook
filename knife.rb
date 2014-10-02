current_dir = File.dirname(__FILE__)

log_level :info
log_location STDOUT
syntax_check_cache_path "#{ENV['HOME']}/.chef/syntax_check_cache"
chef_server_url "#{ENV['KNIFE_CHEF_SERVER']}"
client_key 'deploy.pem'
node_name "#{ENV['KNIFE_NODE_NAME']}"
cookbook_path ["#{current_dir}/cookbooks"]
