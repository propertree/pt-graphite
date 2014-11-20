#
# Cookbook Name:: pt-graphite
# Recipe:: graphite
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

package 'graphite-carbon' do
  version node['graphite']['version']
end

template '/etc/default/graphite-carbon' do
  source 'graphite-carbon.erb'
  mode   '0644'
  if node['graphite']['enable']
    notifies :restart, 'service[carbon-cache]', :delayed
  end
end

template '/etc/carbon/carbon.conf' do
  source 'carbon.conf.erb'
  mode   '0644'
  if node['graphite']['enable']
    notifies :restart, 'service[carbon-cache]', :delayed
  end
end

template '/etc/carbon/storage-schemas.conf' do
  source 'storage-schemas.conf.erb'
  mode   '0644'
  if node['graphite']['enable']
    notifies :restart, 'service[carbon-cache]', :delayed
  end
end

template '/etc/carbon/storage-aggregation.conf' do
  source 'storage-aggregation.conf.erb'
  mode   '0644'
  if node['graphite']['enable']
    notifies :restart, 'service[carbon-cache]', :delayed
  end
end

service 'carbon-cache' do
  if node['graphite']['enable']
    action [:enable, :start]
  else
    action [:disable, :stop]
  end
end
