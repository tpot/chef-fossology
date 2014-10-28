#
# Cookbook Name:: fossology
# Recipe:: config
#
# Copyright (C) 2014, Hewlett-Packard Development Company, L.P.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# FOSSology configuration

hosts_list = []

hosts = data_bag("fossology_hosts")
hosts.each do |key|
  hosts_list << data_bag_item("fossology_hosts", key)
end

template "/etc/fossology/fossology.conf" do
  source "fossology.conf.erb"
  mode 0644
  variables(:server => node["fossology"]["server"], :hosts => hosts_list)
  if node.recipes.include?("fossology::server")
    notifies :restart, "service[fossology]"
  end
end

template "/etc/fossology/Db.conf" do
  source "Db.conf.erb"
  variables(:server => node["fossology"]["server"])
  mode 0644
end

# SSH key for FOSSology user

home = "/home/fossy"

directory "#{home}/.ssh" do
  owner "fossy"
  group "fossy"
  action :create
end

file "#{home}/.ssh/authorized_keys" do
  content "#{node["fossology"]["ssh_public_key"]}\n"
  owner "fossy"
  group "fossy"
  mode 0644
end

file "#{home}/.ssh/id_rsa.pub" do
  content "#{node["fossology"]["ssh_public_key"]}\n"
  owner "fossy"
  group "fossy"
  mode 0644
end

file "#{home}/.ssh/id_rsa" do
  content "#{node["fossology"]["ssh_private_key"]}\n"
  owner "fossy"
  group "fossy"
  mode 0400
  backup false
end
