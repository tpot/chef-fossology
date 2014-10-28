#
# Cookbook Name:: fossology
# Recipe:: server
#
# Copyright (C) 2014, Hewlett-Packard Development Company, L.P.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require "etc"

# Create users and ssh keys

include_recipe "user::data_bag"

# Install and configure PostgreSQL

include_recipe "postgresql::server"

# Install and configure OpenSSH

include_recipe "openssh"

# Install and configure fossology server node

include_recipe "fossology::apt"

package "fossology"

service "fossology" do
  action [:enable, :start]
  supports :status => false, :restart => true
end

include_recipe "fossology::config"

# Install and configure apache2

include_recipe "fossology::apache2"

# Install and configure NFS for sharing repository between agents

include_recipe "nfs::server"

nfs_export "/srv/fossology/repository" do
  network "*"
  options ["no_root_squash", "fsid=0", "insecure"]
  writeable true
end
