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

# Install and configure apache2

include_recipe "fossology::apache2"
