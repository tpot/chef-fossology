#
# Cookbook Name:: fossology
# Recipe:: default
#
# Copyright (C) 2014, Hewlett-Packard Development Company, L.P.
#
# All rights reserved - Do Not Redistribute
#

# Install fossology

apt_repository "fossology" do
  uri "http://www.fossology.org/releases/2.4.0/Ubuntu/"
  distribution "12.04"
  components ["contrib"]
  trusted true
end

package "fossology"

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
end
