#
# Cookbook Name:: anyenv
# Recipe:: user
#
# Copyright 2015, uzyexe
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'anyenv::user_install'

node.default_unless['user']['name'] = node['anyenv']['user'] || ENV['USER']

if node['anyenv']['user']
  node.default_unless['user']['home'] = "#{node['anyenv']['user_home_root']}/#{node['user']['name']}"
else
  node.default_unless['user']['home'] = ENV['HOME']
end

anyenvs = %w{
  Renv
  crenv
  denv
  erlenv
  exenv
  goenv
  hsenv
  jenv
  luaenv
  ndenv
  nenv
  nodenv
  phpenv
  plenv
  pyenv
  rbenv
  sbtenv
  scalaenv
  swiftenv
}

anyenvs.each do |install_env|
  bash install_env do
    user node['user']['name']
    cwd node['user']['home']
    environment "HOME" => node['user']['home']
    code <<-EOC
      . /etc/profile
      anyenv install #{install_env}
    EOC
    not_if { File.exist?("#{node['user']['home']}/.anyenv/envs/#{install_env}") }
  end
end

# install specified versions through *env
anyenv_map = {
  "r"        => "Renv",
  "crystal"  => "crenv",
  "d"        => "denv",
  "erlang"   => "erlenv",
  "elixir"   => "exenv",
  "golang"   => "goenv",
  "haskell"  => "hsenv",
  "java"     => "jenv",
  "lua"      => "luaenv",
  "node"     => "ndenv",
  "php"      => "phpenv",
  "perl"     => "plenv",
  "python"   => "pyenv",
  "ruby"     => "rbenv",
  "sbt"      => "sbtenv",
  "scala"    => "scalaenv",
}
anyenv_map.keys.each do |program|
  anyenv = node['anyenv']
  next unless anyenv.key?(program)
  anyenv[program]['versions'].each do |version|
    install_script = <<-EOC
      . /etc/profile
      #{anyenv_map[program]} install #{version}
    EOC
    install_script << "#{anyenv_map[program]} global #{version};" if version == anyenv[program]['global']

    execute "#{program} - #{version} at #{node['user']['home']}/.anyenv" do
      environment "HOME" => node['user']['home']
      user node['user']['name']
      command install_script
      not_if { File.exist?("#{node['user']['home']}/.anyenv/envs/#{anyenv_map[program]}/versions/#{version}") }
    end
  end
end
