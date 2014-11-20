#
# Cookbook Name:: pt-graphite
# Recipe:: graphite_web
#
# Copyright 2014, ProperTree
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# 'Software'), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

include_recipe 'apache2'
include_recipe 'apache2::mod_wsgi'

package 'graphite-web' do
  version node['graphite']['web']['version']
end

template '/etc/graphite/local_settings.py' do
  source   'local_settings.py.erb'
  mode     '0644'
  notifies :run, 'execute[graphite-web-syncdb]', :immediately
end

execute 'graphite-web-syncdb' do
  command 'graphite-manage syncdb --noinput'
  action  :nothing
end

file '/var/lib/graphite/graphite.db' do
  owner '_graphite'
  group '_graphite'
  mode  '0644'
end

template '/etc/apache2/sites-available/graphite.conf' do
  source 'graphite.conf.erb'
  mode   '0644'
end

apache_site 'graphite'
