#
# Cookbook Name:: anyenv
# Recipe:: user_install
#
# Copyright 2015, uzyexe
#
# All rights reserved - Do Not Redistribute
#

node.default_unless['user']['name'] = node['anyenv']['user']
node.default_unless['user']['home'] = "#{node['anyenv']['user_home_root']}/#{node['user']['name']}"

# install required packages
case node['platform']
when 'debian', 'ubuntu'
  install_packages = %w{
    git
    gcc
    make
    openssl
    libssl-dev
    libbz2-dev
    libffi-dev
    libreadline-dev
    libsqlite3-dev
    curl
  }
when "centos", "redhat", "amazon", "scientific"
    install_packages = %w{
    gcc
    bzip2
    bzip2-devel
    libffi-devel
    openssl
    openssl-devel
    readline
    readline-devel
    curl
    git
  }
when "mac_os_x"
    install_packages = %w{
    git
  }
end

install_packages.each do |p|
  package p do
    action :install
  end
end

if node['platform'] == 'mac_os_x'
  cookbook_file '/etc/profile' do
    source 'osx-profile'
    owner 'root'
    mode '0755'
  end

  directory '/etc/profile.d' do
    owner 'root'
    mode '0755'
  end
end

template '/etc/profile.d/anyenv.sh' do
  source 'anyenv.sh.erb'
  owner 'root'
  mode '0755'
  only_if { node['anyenv']['create_profiled'] }
end

# install anyenv
execute 'install anyenv' do
  user node['anyenv']['user']
  cwd  node['user']['home']
  command "git clone #{node['anyenv']['git_url']} #{node['user']['home']}/.anyenv"
  not_if { File.exist?("#{node['user']['home']}/.anyenv") }
end
