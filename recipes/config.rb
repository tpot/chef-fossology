#
# Cookbook Name:: fossology
# Recipe:: config
#
# Copyright (C) 2014, Hewlett-Packard Development Company, L.P.
#
# All rights reserved - Do Not Redistribute
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
  action :create
end

file "#{home}/.ssh/authorized_keys" do
  content "#{node["fossology"]["ssh_public_key"]}\n"
  mode 0644
end

file "#{home}/.ssh/id_rsa.pub" do
  content "#{node["fossology"]["ssh_public_key"]}\n"
  mode 0644
end

file "#{home}/.ssh/id_rsa" do
  content "#{node["fossology"]["ssh_private_key"]}\n"
  mode 0400
  backup false
end
