#
# Cookbook Name:: fossology
# Recipe:: default
#
# Copyright (C) 2014, Hewlett-Packard Development Company, L.P.
#
# All rights reserved - Do Not Redistribute
#

apt_repository "fossology" do
  uri "http://www.fossology.org/releases/#{node["fossology"]["version"]}/Ubuntu/"
  distribution node["platform_version"]
  components ["contrib"]
  trusted true
end

