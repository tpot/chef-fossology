#
# Cookbook Name:: fossology
# Recipe:: server
#
# Copyright (C) 2014, Hewlett-Packard Development Company, L.P.
#
# All rights reserved - Do Not Redistribute
#

require "etc"

# Install and configure fossology server node

include_recipe "fossology::apt"
package "fossology"

include_recipe "fossology::config"

# Install and configure apache2

include_recipe "fossology::apache2"

# Install and configure NFS for sharing repository between agents

include_recipe "nfs::server"

fossy_uid = Etc.getpwnam("fossy").uid
fossy_gid = Etc.getgrnam("fossy").gid

nfs_export "/srv/fossology/repository" do
  network "*"
  options ["all_squash", "fsid=0", "anonuid=#{fossy_uid}", "anongid=#{fossy_gid}", "insecure", "ro"]
  writeable false
end
