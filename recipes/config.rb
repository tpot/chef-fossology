#
# Cookbook Name:: fossology
# Recipe:: config
#
# Copyright (C) 2014, Hewlett-Packard Development Company, L.P.
#
# All rights reserved - Do Not Redistribute
#

template "/etc/fossology/fossology.conf" do
  source "fossology.conf.erb"
  mode 0644
end

template "/etc/fossology/Db.conf" do
  source "Db.conf.erb"
  mode 0644
end
