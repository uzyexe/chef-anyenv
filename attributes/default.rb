default['anyenv']['user'] = ""

# git repository containing anyenv
default['anyenv']['git_url'] = 'https://github.com/riywo/anyenv.git'
default['anyenv']['git_ref'] = 'master'

# whether to create profile.d shell script
default['anyenv']['create_profiled'] = true

# extra system-wide tunables
default['anyenv']['root_path'] = '/usr/local/anyenv'

case node['platform_family']
when 'rhel', 'fedora'
  default['anyenv']['install_pkgs'] = %w(git grep)
  default['anyenv']['user_home_root'] = '/home'
  default['anyenv']['system_home'] = '/root'
when 'debian', 'suse'
  default['anyenv']['install_pkgs'] = %w(git-core grep)
  default['anyenv']['user_home_root'] = '/home'
  default['anyenv']['system_home'] = '/root'
when 'mac_os_x'
  default['anyenv']['install_pkgs'] = %w(git)
  default['anyenv']['user_home_root'] = '/Users'
  default['anyenv']['system_home'] = '/var/root'
when 'freebsd'
  default['anyenv']['install_pkgs'] = %w(git bash)
  default['anyenv']['user_home_root'] = '/usr/home'
  default['anyenv']['system_home'] = '/root'
when 'gentoo'
  default['anyenv']['install_pkgs'] = %w(git)
  default['anyenv']['user_home_root'] = '/home'
  default['anyenv']['system_home'] = '/root'
when 'arch'
  default['anyenv']['install_pkgs'] = %w(git grep)
  default['anyenv']['user_home_root'] = '/home'
  default['anyenv']['system_home'] = '/root'
end
