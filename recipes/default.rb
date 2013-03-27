#
# Cookbook Name:: chef-phpdaemon
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'chef-libevent'
include_recipe 'openssl'

package 'libcurl4-openssl-dev' 
package 'pkg-config'

php_pear 'event' do
  action :install
  not_if 'php -m | grep event'
end

php_pear 'eio' do
  action :install
  not_if 'php -m | grep eio'
end

php_pear 'proctitle' do
  options 'channel://pecl.php.net/proctitle-0.1.2'
  not_if 'php -m | grep proctitle'
  action :install
end

include_recipe 'chef-phpdaemon::runkit'

include_recipe 'git'

directory "/opt/phpdaemon" do
  owner "root"
  group "root"
  mode "0755"
  action :create
end

git "/opt/phpdaemon" do
  repository "https://github.com/kakserpom/phpdaemon.git"
  revision "master"
  action :sync
end

file '/opt/phpdaemon/bin/phpd' do
  mode '0755'
end

link '/usr/bin/phpd' do
  to '/opt/phpdaemon/bin/phpd'
end

