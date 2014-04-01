#
# Cookbook Name:: fossology
# Recipe:: agent
#
# Copyright (C) 2014, Hewlett-Packard Development Company, L.P.
#
# All rights reserved - Do Not Redistribute
#

require "etc"

# Install and configure agent-only node

include_recipe "fossology::apt"

agent_packages = ["fossology-common", "fossology-buckets", "fossology-copyright",
                  "fossology-delagent", "fossology-mimetype", "fossology-nomos",
                  "fossology-pkgagent", "fossology-ununpack", "fossology-wgetagent"]

agent_packages.each do |p|
  package p
end

include_recipe "fossology::config"
include_recipe "nfs"

mount "/srv/fossology/repository" do
  fstype "nfs"
  device "#{node["fossology"]["server"]["name"]}:/srv/fossology/repository"
  options ["rw"]
  action [:mount, :enable]
end
