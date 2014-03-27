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

ruby_block "fossy_get_ids" do
  block do
    fossy_uid = Etc.getpwnam("fossy").uid
    fossy_gid = Etc.getgrnam("fossy").gid
  end
end

mount "/srv/fossology/repository" do
  fstype "nfs"
  device "10.0.0.35:/srv/fossology/repository"
  options ["rw"]
  action [:mount, :enable]
end
