#
# Cookbook Name:: fossology
# Recipe:: apache2
#
# Copyright (C) 2014, Hewlett-Packard Development Company, L.P.
#
# All rights reserved - Do Not Redistribute
#

# Install and configure apache2

# Remove apache2 site stuff installed by package

["/etc/apache2/sites-enabled/fossology.conf",
 "/etc/apache2/sites-available/fossology.conf"].each do |f|
  file f do
    action :delete
  end
end

# Install and configure apache

include_recipe "apache2"

web_app "chef-fossology" do
  server_name "fossology.mon.hpcloud.net"
  server_aliases ["fossology.mon.hpcloud.net"]
  docroot "/usr/share/fossology/www/ui"
  cookbook "apache2"
end
