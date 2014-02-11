node['mongodb']['gems'].each do |gem, version|
  if Gem.const_defined?('Version') && Gem::Version.new(Chef::VERSION) < Gem::Version.new('10.12.0')
    gem_package g do
      version version
      action :nothing
    end.run_action(:install)
    Gem.clear_paths
  else
    chef_gem g do
      version version
      action :install
    end
  end
end
