#
# Cookbook Name:: fossology
# Recipe:: config
#
# Copyright (C) 2014, Hewlett-Packard Development Company, L.P.
#
# All rights reserved - Do Not Redistribute
#

hosts_list = []

hosts = data_bag("fossology_hosts")
hosts.each do |key|
  hosts_list << data_bag_item("fossology_hosts", key)
end

template "/etc/fossology/fossology.conf" do
  source "fossology.conf.erb"
  mode 0644
  variables(:server => node["fossology"]["server"], :hosts => hosts)
end

template "/etc/fossology/Db.conf" do
  source "Db.conf.erb"
  variables(:server => node["fossology"]["server"])
  mode 0644
end
