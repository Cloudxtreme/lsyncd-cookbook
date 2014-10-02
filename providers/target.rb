use_inline_resources

action :create do
  fail 'No SSH host provided for lsyncd target' if new_resource.mode == 'rsyncssh' && new_resource.host.nil?

  if new_resource.rsync_opts
    rsync_opts = '{'
    new_resource.rsync_opts.each_with_index do |opt, index|
      rsync_opts << "\"#{opt}\""
      rsync_opts << ', ' if index < new_resource.rsync_opts.length - 1
    end
    rsync_opts << '}'
  end

  if new_resource.exclude
    exclude = '{'
    new_resource.exclude.each_with_index do |opt, index|
      exclude << "\"#{opt}\""
      exclude << ', ' if index < new_resource.exclude.length - 1
    end
    exclude << '}'
  end

  template "/etc/lsyncd/conf.d/#{new_resource.name}.lua" do
    cookbook new_resource.cookbook
    source 'target.erb'
    mode 0644
    variables(
      mode: new_resource.mode,
      source: new_resource.source,
      target: new_resource.target,
      user: new_resource.user,
      host: new_resource.host,
      rsync_opts: rsync_opts,
      exclude: exclude,
      exclude_from: new_resource.exclude_from
    )
    action :create
  end
end

action :delete do
  file "/etc/lsyncd/conf.d/#{new_resource.name}.lua" do
    action :delete
  end
end
